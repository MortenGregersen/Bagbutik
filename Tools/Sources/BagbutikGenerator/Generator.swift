import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// Errors that can occur while rendering Swift sources from the spec and collected docs.
public enum GeneratorError: Error, Equatable {
    /// The URL is not a file URL
    case notFileUrl(FileURLType)
    /// The operation has no documentation
    case noDocumentationForOperation(String)
    /// The schema has no documentation
    case noDocumentationForSchema(String)
    /// The file could not be created
    case couldNotCreateFile(String)

    /// The type of the file URL
    public enum FileURLType: Sendable {
        /// The URL for the spec file
        case specFileURL
        /// The URL for the output directory
        case outputDirURL
        /// The URL for the documentation directory
        case documentationDirUrl
    }
}

/**
 The closure used to load and decode the OpenAPI spec from disk.

 Keeping this injectable makes the generator straightforward to unit test.

 - Parameter fileUrl: The file URL of the OpenAPI spec.
 - Returns: A decoded ``Spec`` value.
 */
typealias LoadSpec = (_ fileUrl: URL) throws -> Spec

/// Generates endpoint and model source files from the decoded spec and normalized documentation.
public class Generator {
    private static let migratedPackages: Set<PackageName> = [.appStore, .gameCenter, .marketplaces, .provisioning, .reporting, .testFlight, .users, .webhooks, .xcodeCloud]
    private static let sharedSchemas: Set<String> = [
        "App",
        "Build",
        "BuildAudienceType",
        "DeviceFamily",
        "GameCenterAchievementVersionV2",
        "GameCenterActivityVersion",
        "GameCenterAppVersion",
        "GameCenterChallengeVersion",
        "GameCenterDetail",
        "GameCenterEnabledVersion",
        "GameCenterLeaderboardSetVersionV2",
        "GameCenterLeaderboardVersionV2",
        "GameCenterVersionState",
        "ImageAsset",
        "SubscriptionStatusUrlVersion",
        "TerritoryCode",
    ]

    private let loadSpec: LoadSpec
    private let fileManager: TestableFileManager
    private let docsLoader: DocsLoader
    private let print: @MainActor (String) -> Void

    /// Creates a generator configured with the default spec loader, docs loader, and file manager.
    public convenience init() {
        let loadSpec: LoadSpec = { fileUrl in
            let specData = try Data(contentsOf: fileUrl)
            var spec = try JSONDecoder().decode(Spec.self, from: specData)
            try spec.applyManualPatches()
            spec.flattenIdenticalSchemas()
            return spec
        }
        self.init(loadSpec: loadSpec, fileManager: FileManager.default, docsLoader: DocsLoader(), print: { Swift.print($0) })
    }

    init(loadSpec: @escaping LoadSpec, fileManager: TestableFileManager, docsLoader: DocsLoader, print: @escaping @MainActor (String) -> Void) {
        self.loadSpec = loadSpec
        self.fileManager = fileManager
        self.docsLoader = docsLoader
        self.print = print
    }

    /**
     Loads a spec and renders all endpoint and model files into the output directory.

     The generator expects documentation JSON produced by ``DocsFetcher`` and loaded through
     ``DocsLoader`` so generated symbols can include Apple's documentation in Xcode.

     - Parameters:
        - specFileURL: The file URL of the OpenAPI spec.
        - outputDirURL: The root directory where generated source files should be written.
        - documentationDirURL: The directory containing the normalized documentation cache.
     */
    public func generateAll(specFileURL: URL, outputDirURL: URL, documentationDirURL: URL) async throws {
        guard specFileURL.isFileURL else { throw GeneratorError.notFileUrl(.specFileURL) }
        guard outputDirURL.isFileURL else { throw GeneratorError.notFileUrl(.outputDirURL) }
        guard documentationDirURL.isFileURL else { throw GeneratorError.notFileUrl(.documentationDirUrl) }
        await print("🔍 Loading spec \(specFileURL.path)...")
        let spec = try loadSpec(specFileURL)

        await print("🔍 Loading docs \(documentationDirURL.path)...")
        try await docsLoader.loadDocs(documentationDirURL: documentationDirURL)
        try await docsLoader.applyManualDocumentation()

        let schemas = spec.components.schemas
        var packageBySchema = [String: PackageName]()
        for schema in schemas.values {
            packageBySchema[schema.name] = try await Self.resolvePackageName(for: schema, docsLoader: docsLoader)
        }
        var endpointRootsByPackage = [PackageName: Set<String>]()
        for path in spec.paths.values {
            for operation in path.operations {
                let packageName = try await Self.resolvePackageName(for: operation, docsLoader: docsLoader)
                endpointRootsByPackage[packageName, default: []]
                    .formUnion(Self.endpointSchemaNames(for: operation))
            }
        }
        let schemaReferenceGraph = SchemaReferenceGraph(schemas: schemas)
        let modulePlan = RuntimeModulePlan(
            graph: schemaReferenceGraph,
            packageBySchema: packageBySchema,
            migratedPackages: Self.migratedPackages,
            sharedSchemas: Self.sharedSchemas,
            additionalRootsByPackage: endpointRootsByPackage
        )

        for packageName in PackageName.allCases {
            let packageDirURL = outputDirURL.appendingPathComponent(packageName.name)
            if packageName != .core {
                try removeChildren(at: packageDirURL)
                try fileManager.createDirectory(at: packageDirURL, withIntermediateDirectories: true, attributes: nil)
            } else {
                let endpointsDirURL = packageDirURL.appendingPathComponent("Endpoints")
                try removeChildren(at: endpointsDirURL)
                try fileManager.createDirectory(at: endpointsDirURL, withIntermediateDirectories: true, attributes: nil)
                let modelsDirURL = packageDirURL.appendingPathComponent("Models")
                try removeChildren(at: modelsDirURL)
                try fileManager.createDirectory(at: modelsDirURL, withIntermediateDirectories: true, attributes: nil)
            }
        }
        let generatedModelsDirectories = [RuntimeModulePlan.ModelModule.modelsShared.targetName]
            + Self.migratedPackages
                .map { RuntimeModulePlan.ModelModule.domainModels($0).targetName }
                .sorted()
        for generatedModelsDirectory in generatedModelsDirectories {
            let directoryURL = outputDirURL.appendingPathComponent(generatedModelsDirectory)
            try removeGeneratedChildren(at: directoryURL)
            try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
        }

        try await withThrowingTaskGroup(of: [RenderResult].self) { taskGroup in
            for path in spec.paths.values {
                taskGroup.addTask { [docsLoader, modulePlan] in
                    var renderResults = [RenderResult]()
                    let operationRenderer = OperationRenderer(docsLoader: docsLoader, shouldFormat: true)
                    for operation in path.operations {
                        let name = operation.getVersionedName(path: path)
                        let fileName = "\(name).swift"
                        let packageName = try await Self.resolvePackageName(for: operation, docsLoader: docsLoader)
                        var renderedOperation = try await operationRenderer.render(operation: operation, in: path) + "\n"
                        if Self.migratedPackages.contains(packageName) {
                            let domainModelModule = RuntimeModulePlan.ModelModule.domainModels(packageName)
                            renderedOperation = renderedOperation
                                .replacingOccurrences(
                                    of: "import BagbutikCore",
                                    with: "import BagbutikCore\n" + Self.endpointModelImports(
                                        for: operation,
                                        domainModelModule: domainModelModule,
                                        modulePlan: modulePlan
                                    )
                                )
                        }
                        let packageDirURL = outputDirURL.appendingPathComponent(packageName.name).appendingPathComponent("Endpoints")
                        let operationDirURL = Self.getOperationsDirURL(for: path, in: packageDirURL)
                        renderResults.append(.init(dirURL: operationDirURL, name: name, fileName: fileName, contents: renderedOperation))
                    }
                    return renderResults
                }
            }
            for try await renderResults in taskGroup {
                for renderResult in renderResults {
                    await print("⚡️ Generating endpoint \(renderResult.name)...")
                    try self.fileManager.createDirectory(at: renderResult.dirURL, withIntermediateDirectories: true, attributes: nil)
                    let fileURL = renderResult.dirURL.appendingPathComponent(renderResult.fileName)
                    guard self.fileManager.createFile(atPath: fileURL.path, contents: renderResult.contents.data(using: .utf8), attributes: nil) else {
                        throw GeneratorError.couldNotCreateFile(fileURL.path)
                    }
                }
            }
        }

        try await withThrowingTaskGroup(of: RenderResult?.self) { taskGroup in
            for schema in schemas.values {
                taskGroup.addTask { [docsLoader, schemas, packageBySchema, schemaReferenceGraph, modulePlan] in
                    let packageName = packageBySchema[schema.name]!
                    let modelModule = modulePlan[schema.name]
                    guard modelModule != .unassigned else { return nil }
                    let referencedModelModules = Set(schemaReferenceGraph.references[schema.name, default: []]
                        .map { modulePlan[$0] })
                    let model = try await Generator.generateModel(
                        for: schema,
                        modelModule: modelModule,
                        referencedModelModules: referencedModelModules,
                        otherSchemas: schemas,
                        docsLoader: docsLoader
                    )
                    let fileName = model.name + ".swift"

                    let modelsDirURL: URL = switch modelModule {
                    case .modelsShared, .domainModels:
                        outputDirURL.appendingPathComponent(modelModule.targetName)
                    case .core:
                        outputDirURL.appendingPathComponent("BagbutikCore").appendingPathComponent("Models")
                    case .unassigned:
                        fatalError("Unassigned models are not rendered")
                    }
                    return .init(dirURL: modelsDirURL, name: model.name, fileName: fileName, contents: model.contents)
                }
            }
            for try await renderResult in taskGroup {
                guard let renderResult else { continue }
                await print("⚡️ Generating model \(renderResult.name)...")
                try self.fileManager.createDirectory(at: renderResult.dirURL, withIntermediateDirectories: true, attributes: nil)
                let fileURL = renderResult.dirURL.appendingPathComponent(renderResult.fileName)
                guard self.fileManager.createFile(atPath: fileURL.path, contents: renderResult.contents.data(using: .utf8), attributes: nil) else {
                    throw GeneratorError.couldNotCreateFile(fileURL.path)
                }
            }
        }

        let operationsCount = spec.paths.reduce(into: 0) { $0 += $1.value.operations.count }
        let modelsCount = spec.components.schemas.count
        await print("🎉 Finished generating \(operationsCount) endpoints and \(modelsCount) models! 🎉")
    }

    private struct RenderResult {
        let dirURL: URL
        let name: String
        let fileName: String
        let contents: String
    }

    private func removeChildren(at url: URL) throws {
        if fileManager.fileExists(atPath: url.path) {
            try fileManager.removeItem(at: url)
        }
    }

    private func removeGeneratedChildren(at url: URL) throws {
        guard fileManager.fileExists(atPath: url.path) else { return }
        for childURL in try fileManager.contentsOfDirectory(at: url)
            where childURL.lastPathComponent != "Extensions" {
            try fileManager.removeItem(at: childURL)
        }
    }

    private static func getOperationsDirURL(for path: Path, in endpointsDirURL: URL) -> URL {
        let operationsDirURL = endpointsDirURL.appendingPathComponent(path.info.mainType)
        guard path.info.isRelationship else { return operationsDirURL }
        return operationsDirURL.appendingPathComponent("Relationships")
    }

    private static func resolvePackageName(for schema: Schema, docsLoader: DocsLoader) async throws -> PackageName {
        if let documentation = try await docsLoader.resolveDocumentationForSchema(named: schema.name) {
            return try DocsLoader.resolvePackageName(for: documentation)
        }
        if let inferredPackageName = DocsLoader.resolvePackageName(from: schema.name) {
            return inferredPackageName
        }
        throw GeneratorError.noDocumentationForSchema(schema.name)
    }

    private static func resolvePackageName(
        for operation: BagbutikSpecDecoder.Operation,
        docsLoader: DocsLoader
    ) async throws -> PackageName {
        if let documentation = try await docsLoader.resolveDocumentationForOperation(withId: operation.id) {
            return try DocsLoader.resolvePackageName(for: Documentation.operation(documentation))
        }
        if let inferredPackageName = DocsLoader.resolvePackageName(from: operation.id) {
            return inferredPackageName
        }
        throw GeneratorError.noDocumentationForOperation(operation.id)
    }

    private static func endpointSchemaNames(
        for operation: BagbutikSpecDecoder.Operation
    ) -> Set<String> {
        var schemaNames: Set<String> = [
            operation.successResponseType,
            operation.errorResponseType,
        ]
        if let requestBody = operation.requestBody {
            schemaNames.insert(requestBody.name)
        }
        for parameter in operation.parameters ?? [] {
            let parameterType: BagbutikSpecDecoder.Operation.Parameter.ParameterValueType?
            switch parameter {
            case .filter(_, let type, _, _):
                parameterType = type
            case .exists(_, let type, _):
                parameterType = type
            case .fields(_, let type, _, _):
                parameterType = type
            case .sort(let type, _):
                parameterType = type
            case .include(let type):
                parameterType = type
            case .custom(_, let type, _):
                parameterType = type
            case .limit:
                parameterType = nil
            }
            guard let parameterType, case .simple(let type) = parameterType else { continue }
            schemaNames.insert(type.description)
        }
        return schemaNames
    }

    private static func endpointModelImports(
        for operation: BagbutikSpecDecoder.Operation,
        domainModelModule: RuntimeModulePlan.ModelModule,
        modulePlan: RuntimeModulePlan
    ) -> String {
        var directlyReferencedModules = Set(endpointSchemaNames(for: operation).map { modulePlan[$0] })
            .subtracting([.core, .unassigned, domainModelModule])
        directlyReferencedModules.insert(domainModelModule)
        return directlyReferencedModules
            .map(\.targetName)
            .sorted()
            .map { "import \($0)" }
            .joined(separator: "\n")
    }

    /**
     Renders one schema into the generated Swift source for the appropriate package.

     - Parameters:
        - schema: The schema to render.
        - packageName: The package that should contain the generated type.
        - otherSchemas: The complete schema index, used to resolve references while rendering.
        - docsLoader: The documentation loader used to resolve symbol comments.
     - Returns: The rendered model name, its full file contents, and the original schema documentation URL.
     */
    static func generateModel(
        for schema: Schema,
        modelModule: RuntimeModulePlan.ModelModule,
        referencedModelModules: Set<RuntimeModulePlan.ModelModule>? = nil,
        otherSchemas: [String: Schema],
        docsLoader: DocsLoader
    )
        async throws -> (name: String, contents: String, url: String?) {
        let renderedSchema: String = switch schema {
        case .enum(let enumSchema):
            try await EnumSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(enumSchema: enumSchema)
        case .object(let objectSchema):
            try await ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(objectSchema: objectSchema, otherSchemas: otherSchemas)
        case .binary(let binarySchema):
            try await BinarySchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(binarySchema: binarySchema)
        case .plainText(let plainTextSchema):
            try await PlainTextSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(plainTextSchema: plainTextSchema)
        }
        var imports = ["import Foundation"]
        switch modelModule {
        case .modelsShared:
            let dependencies = (referencedModelModules ?? [])
                .union([.core])
                .subtracting([.modelsShared, .unassigned])
            imports.append(contentsOf: dependencies
                .sorted { $0.targetName < $1.targetName }
                .map { "import \($0.targetName)" })
        case let .domainModels(package):
            let dependencies = (referencedModelModules ?? [])
                .union([.core])
                .subtracting([.domainModels(package), .unassigned])
            imports.append(contentsOf: dependencies
                .sorted { $0.targetName < $1.targetName }
                .map { "import \($0.targetName)" })
        case .core:
            break
        case .unassigned:
            break
        }
        let contents = """
        \(imports.sorted().joined(separator: "\n"))

        \(renderedSchema)
        
        """
        return (name: schema.name, contents: contents, url: schema.url)
    }
}
