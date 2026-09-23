@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class GeneratorTests: XCTestCase {
    let validSpecFileURL = URL(fileURLWithPath: "/Users/steve/spec.json")
    let validOutputDirURL = URL(fileURLWithPath: "/Users/steve/output")
    let validDocumentationDirURL = URL(fileURLWithPath: "/Users/steve/documentation")
    let testSpec = try! Spec(paths: [
        "/v1/users": Path(path: "/v1/users", info: .init(mainType: "Users", version: "V1", isRelationship: false), operations: [
            .init(id: "users_getCollection",
                  name: "listUsers",
                  method: .get,
                  parameters: [
                    .filter(
                        name: "buildAudienceType",
                        type: .simple(type: .init(type: "BuildAudienceType")),
                        required: false,
                        documentation: "Filter by build audience type"
                    )
                  ],
                  successResponseType: "UsersResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
        "/v2/users/{id}/relationships/visibleApps": Path(path: "/v2/users/{id}/relationships/visibleApps", info: .init(mainType: "Users", version: "V2", isRelationship: true), operations: [
            .init(id: "users_visibleApps_getToManyRelationship",
                  name: "listVisibleAppIdsForUser",
                  method: .get,
                  successResponseType: "UserVisibleAppsLinkagesResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
    ],
    components: .init(schemas: [
        "UsersResponse": .object(.init(name: "UsersResponse", url: "some://url", properties: ["users": .init(type: .arrayOfSchemaRef("User"))])),
        "UserVisibleAppsLinkagesResponse": .object(.init(name: "UserVisibleAppsLinkagesResponse", url: "some://url")),
        "ReplaceUsersResponse": .enum(.init(name: "ReplaceUsersResponse", type: "String", caseValues: ["none", "some"])),
        "BuildAppLinkageResponse": .enum(.init(name: "BuildAppLinkageResponse", type: "String", caseValues: ["none", "some"])),
        "BuildAudienceType": .enum(.init(name: "BuildAudienceType", type: "String", caseValues: ["internalOnly", "appStoreEligible"])),
        "Gzip": .binary(.init(name: "Gzip", url: "other://url")),
        "Csv": .plainText(.init(name: "Csv", url: "other://url")),
        "ErrorResponse": .object(.init(name: "ErrorResponse", url: "some://url"))
    ]))
    lazy var docsLoader = DocsLoader(loadFile: { try Self.loadFile($0) })
    
    func testGenerateAllSimple() async throws {
        // Given
        let fileManager = MockFileManager()
        #if compiler(<6.0)
        let printer = await Printer()
        #else
        let printer = Printer()
        #endif
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)
        // When
        try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)
        // Then
        continueAfterFailure = false
        XCTAssertEqual(fileManager.itemsRemoved, [
            "/Users/steve/output/BagbutikAppStore",
            "/Users/steve/output/BagbutikCore/Endpoints",
            "/Users/steve/output/BagbutikCore/Models",
            "/Users/steve/output/BagbutikGameCenter",
            "/Users/steve/output/BagbutikMarketplaces",
            "/Users/steve/output/BagbutikProvisioning",
            "/Users/steve/output/BagbutikReporting",
            "/Users/steve/output/BagbutikTestFlight",
            "/Users/steve/output/BagbutikUsers",
            "/Users/steve/output/BagbutikWebhooks",
            "/Users/steve/output/BagbutikXcodeCloud",
        ])
        XCTAssertEqual(Set(fileManager.directoriesCreated).sorted(), [
            "/Users/steve/output/BagbutikAppStore",
            "/Users/steve/output/BagbutikAppStore/Endpoints/Users/Relationships",
            "/Users/steve/output/BagbutikAppStoreModels",
            "/Users/steve/output/BagbutikCore/Endpoints",
            "/Users/steve/output/BagbutikCore/Models",
            "/Users/steve/output/BagbutikGameCenter",
            "/Users/steve/output/BagbutikGameCenterModels",
            "/Users/steve/output/BagbutikMarketplaces",
            "/Users/steve/output/BagbutikMarketplacesModels",
            "/Users/steve/output/BagbutikModelsShared",
            "/Users/steve/output/BagbutikProvisioning",
            "/Users/steve/output/BagbutikProvisioningModels",
            "/Users/steve/output/BagbutikReporting",
            "/Users/steve/output/BagbutikReportingModels",
            "/Users/steve/output/BagbutikTestFlight",
            "/Users/steve/output/BagbutikTestFlightModels",
            "/Users/steve/output/BagbutikUsers",
            "/Users/steve/output/BagbutikUsers/Endpoints/Users",
            "/Users/steve/output/BagbutikUsersModels",
            "/Users/steve/output/BagbutikWebhooks",
            "/Users/steve/output/BagbutikWebhooksModels",
            "/Users/steve/output/BagbutikXcodeCloud",
            "/Users/steve/output/BagbutikXcodeCloudModels",
        ])
        XCTAssertEqual(fileManager.filesCreated.map(\.name).sorted(), [
            "BuildAppLinkageResponse.swift",
            "BuildAudienceType.swift",
            "Csv.swift",
            "ErrorResponse.swift",
            "Gzip.swift",
            "ListUsersV1.swift",
            "ListVisibleAppIdsForUserV2.swift",
            "ReplaceUsersResponse.swift",
            "UserVisibleAppsLinkagesResponse.swift",
            "UsersResponse.swift",
        ])
        let firstLogLine = await printer.printedLogs[0]
        let secondLogLine = await printer.printedLogs[1]
        let nextLogLines = await printer.printedLogs[2 ... 11]
        let lastLogLine = await printer.printedLogs[12]
        XCTAssertEqual(firstLogLine, "🔍 Loading spec /Users/steve/spec.json...")
        XCTAssertEqual(secondLogLine, "🔍 Loading docs /Users/steve/documentation...")
        XCTAssertEqual(nextLogLines.sorted(), [
            "⚡️ Generating endpoint ListUsersV1...",
            "⚡️ Generating endpoint ListVisibleAppIdsForUserV2...",
            "⚡️ Generating model BuildAppLinkageResponse...",
            "⚡️ Generating model BuildAudienceType...",
            "⚡️ Generating model Csv...",
            "⚡️ Generating model ErrorResponse...",
            "⚡️ Generating model Gzip...",
            "⚡️ Generating model ReplaceUsersResponse...",
            "⚡️ Generating model UserVisibleAppsLinkagesResponse...",
            "⚡️ Generating model UsersResponse...",
        ])
        XCTAssertEqual(lastLogLine, "🎉 Finished generating 2 endpoints and 8 models! 🎉")
        let usersResponse = String(
            decoding: fileManager.filesCreated.first { $0.name == "UsersResponse.swift" }!.data,
            as: UTF8.self
        )
        XCTAssertTrue(usersResponse.contains("import BagbutikCore"))
        XCTAssertFalse(usersResponse.contains("import BagbutikModelsShared"))
        XCTAssertFalse(usersResponse.contains("import Bagbutik_Models"))
        let listUsers = String(
            decoding: fileManager.filesCreated.first { $0.name == "ListUsersV1.swift" }!.data,
            as: UTF8.self
        )
        XCTAssertTrue(listUsers.contains("import BagbutikCore"))
        XCTAssertFalse(listUsers.contains("import Bagbutik_Core"))
        XCTAssertTrue(listUsers.contains("import BagbutikModelsShared"), listUsers)
        XCTAssertTrue(listUsers.contains("import BagbutikUsersModels"))
        let linkageResponse = String(
            decoding: fileManager.filesCreated.first { $0.name == "UserVisibleAppsLinkagesResponse.swift" }!.data,
            as: UTF8.self
        )
        XCTAssertFalse(linkageResponse.contains("import BagbutikUsersModels"))
        XCTAssertTrue(linkageResponse.contains("import BagbutikCore"))
        XCTAssertFalse(linkageResponse.contains("import BagbutikModelsShared"))
        XCTAssertFalse(linkageResponse.contains("import Bagbutik_Core"))
    }

    func testInvalidSpecFileURL() async throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = URL(string: "https://developer.apple.com")!
        let outputDirURL = validOutputDirURL
        let documentationDirURL = validDocumentationDirURL
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL, documentationDirURL: documentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, .notFileUrl(.specFileURL))
        }
    }
    
    func testInvalidOutputDirURL() async throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = validSpecFileURL
        let outputDirURL = URL(string: "https://developer.apple.com")!
        let documentationDirURL = validDocumentationDirURL
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL, documentationDirURL: documentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, .notFileUrl(.outputDirURL))
        }
    }
    
    func testInvalidDocumentationDirURL() async throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = validSpecFileURL
        let outputDirURL = validOutputDirURL
        let documentationDirURL = URL(string: "https://developer.apple.com")!
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL, documentationDirURL: documentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, .notFileUrl(.documentationDirUrl))
        }
    }
    
    func testUnloadableSpecFileURL() async throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = URL(fileURLWithPath: "/Users/timcook/app-store-connect-openapi-spec.json")
        let outputDirURL = validOutputDirURL
        let documentationDirURL = validDocumentationDirURL
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL, documentationDirURL: documentationDirURL)) {
            // Then
            let nsError = $0 as NSError
            #if (os(Linux) || os(Android) || os(Windows)) && compiler(<6.0)
            XCTAssertEqual(nsError.domain, "NSPOSIXErrorDomain")
            XCTAssertEqual(nsError.code, 2)
            #else
            XCTAssertEqual(nsError.domain, "NSCocoaErrorDomain")
            XCTAssertEqual(nsError.code, 260)
            #endif
        }
    }
    
    func testFailedCreatingEndpoint() async throws {
        // Given
        let fileManager = MockFileManager()
        fileManager.fileNameToFailCreating = "ListUsersV1.swift"
        #if compiler(<6.0)
        let printer = await Printer()
        #else
        let printer = Printer()
        #endif
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)
        // When
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, .couldNotCreateFile("/Users/steve/output/BagbutikUsers/Endpoints/Users/ListUsersV1.swift"))
        }
    }
    
    func testFailedCreatingModel() async throws {
        // Given
        let fileManager = MockFileManager()
        fileManager.fileNameToFailCreating = "UsersResponse.swift"
        #if compiler(<6.0)
        let printer = await Printer()
        #else
        let printer = Printer()
        #endif
        let generator = Generator(loadSpec: { _ in
            try Spec(paths: [:], components: .init(schemas: [
                "UsersResponse": self.testSpec.components.schemas["UsersResponse"]!
            ]))
        }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)
        // When
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, .couldNotCreateFile("/Users/steve/output/BagbutikUsersModels/UsersResponse.swift"))
        }
    }
    
    func testNoDocumentationForOperation() async throws {
        // Given
        let fileManager = MockFileManager()
        let docsLoader = DocsLoader(loadFile: { _ in "{}".data(using: .utf8)! })
        #if compiler(<6.0)
        let printer = await Printer()
        #else
        let printer = Printer()
        #endif
        let generator = Generator(loadSpec: { _ in
            try Spec(paths: [
                "/v1/users": Path(path: "/v1/users", info: .init(mainType: "Users", version: "V1", isRelationship: false), operations: [
                    .init(id: "users-delete_instance",
                          name: "deleteUser",
                          method: .delete,
                          successResponseType: "EmptyResponse",
                          errorResponseType: "ErrorResponse"),
                ]),
            ], components: .init(schemas: [:]))
        }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)
        try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)
    }
    
    func testInferPackageNameForSchemaWithoutDocumentation() async throws {
        // Given
        let fileManager = MockFileManager()
        let docsLoader = DocsLoader(loadFile: { _ in "{}".data(using: .utf8)! })
        #if compiler(<6.0)
        let printer = await Printer()
        #else
        let printer = Printer()
        #endif
        let generator = Generator(loadSpec: { _ in
            try Spec(
                paths: [:],
                components: .init(schemas: [
                    "UsersResponse": .object(.init(name: "UsersResponse", url: "some://url"))
                ])
            )
        }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)
        // When
        try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)
        // Then
        XCTAssertEqual(fileManager.filesCreated.map(\.name), ["UsersResponse.swift"])
        XCTAssertTrue(fileManager.directoriesCreated.contains("/Users/steve/output/BagbutikUsersModels"))
    }

    func testInferPackageNameForOperationWithoutDocumentation() async throws {
        let fileManager = MockFileManager()
        let docsLoader = DocsLoader(loadFile: { _ in "{}".data(using: .utf8)! })
        #if compiler(<6.0)
        let printer = await Printer()
        #else
        let printer = Printer()
        #endif
        let generator = Generator(loadSpec: { _ in
            try Spec(paths: [
                "/v1/users": Path(path: "/v1/users", info: .init(mainType: "Users", version: "V1", isRelationship: false), operations: [
                    .init(id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-users",
                          name: "listUsers",
                          method: .get,
                          successResponseType: "UsersResponse",
                          errorResponseType: "ErrorResponse"),
                ]),
            ], components: .init(schemas: [:]))
        }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)

        try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)

        XCTAssertEqual(fileManager.filesCreated.map(\.name), ["ListUsersV1.swift"])
        XCTAssertEqual(fileManager.directoriesCreated.filter { $0.hasSuffix("/BagbutikUsers/Endpoints/Users") }.count, 1)
    }

    func testInferPackageNameForNonRequestSchemaUsesGeneralModelsDirectory() async throws {
        let fileManager = MockFileManager()
        let docsLoader = DocsLoader(loadFile: { _ in "{}".data(using: .utf8)! })
        #if compiler(<6.0)
        let printer = await Printer()
        #else
        let printer = Printer()
        #endif
        let generator = Generator(loadSpec: { _ in
            try Spec(
                paths: [:],
                components: .init(schemas: [
                    "User": .object(.init(name: "User", url: "some://url"))
                ])
            )
        }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)

        try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)

        XCTAssertEqual(fileManager.filesCreated.map(\.name), ["User.swift"])
        XCTAssertTrue(fileManager.directoriesCreated.contains("/Users/steve/output/BagbutikUsersModels"))
    }

    func testGenerateAllDoesNotRemoveMissingChildren() async throws {
        final class MissingFileManager: MockFileManager {
            override func fileExists(atPath path: String) -> Bool {
                false
            }
        }

        let fileManager = MissingFileManager()
        #if compiler(<6.0)
        let printer = await Printer()
        #else
        let printer = Printer()
        #endif
        let generator = Generator(loadSpec: { _ in try Spec(paths: [:], components: .init(schemas: [:])) }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)

        try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)

        XCTAssertTrue(fileManager.itemsRemoved.isEmpty)
    }

    func testGenerateModelAddsImportsForRequestAndLinkageSchemas() async throws {
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let requestSchema = Schema.object(.init(name: "UserUpdateRequest", url: "some://url"))
        let linkageSchema = Schema.object(.init(name: "UserVisibleAppsLinkageResponse", url: "some://url"))

        let requestModel = try await Generator.generateModel(
            for: requestSchema,
            modelModule: .domainModels(.users),
            otherSchemas: [:],
            docsLoader: docsLoader
        )
        let linkageModel = try await Generator.generateModel(
            for: linkageSchema,
            modelModule: .core,
            otherSchemas: [:],
            docsLoader: docsLoader
        )

        XCTAssertTrue(requestModel.contents.contains("import BagbutikCore"))
        XCTAssertFalse(linkageModel.contents.contains("import Bagbutik_"))
    }

    func testGenerateModelImportsOnlyItsReferencedModelModules() async throws {
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let schema = Schema.object(.init(name: "GameCenterDetail", url: "some://url"))

        let model = try await Generator.generateModel(
            for: schema,
            modelModule: .domainModels(.gameCenter),
            referencedModelModules: [.domainModels(.appStore)],
            otherSchemas: [:],
            docsLoader: docsLoader
        )

        XCTAssertTrue(model.contents.contains("import BagbutikAppStoreModels"))
        XCTAssertTrue(model.contents.contains("import BagbutikCore"))
        XCTAssertFalse(model.contents.contains("import BagbutikModelsShared"))
    }

    func testConvenienceInitWithEmptySpecOnDisk() async throws {
        let temporaryDirectoryURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        let specFileURL = temporaryDirectoryURL.appendingPathComponent("spec.json")
        let outputDirURL = temporaryDirectoryURL.appendingPathComponent("Output")
        let documentationDirURL = temporaryDirectoryURL.appendingPathComponent("Documentation")
        try FileManager.default.createDirectory(at: documentationDirURL, withIntermediateDirectories: true)
        defer {
            try? FileManager.default.removeItem(at: temporaryDirectoryURL)
        }

        try #"{"paths":{},"components":{"schemas":{}}}"#.data(using: .utf8)!.write(to: specFileURL)

        try await Generator().generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL, documentationDirURL: documentationDirURL)

        XCTAssertTrue(FileManager.default.fileExists(atPath: outputDirURL.appendingPathComponent("BagbutikCore").path))
    }
    
    private class MockFileManager: TestableFileManager {
        var directoriesCreated = [String]()
        var filesCreated = [(name: String, data: Data)]()
        var itemsRemoved = [String]()
        var fileNameToFailCreating: String?
        
        func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey: Any]?) throws {
            directoriesCreated.append(url.path)
        }
        
        func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey: Any]?) -> Bool {
            let fileName = path.components(separatedBy: "/").last!
            guard fileName != fileNameToFailCreating else { return false }
            filesCreated.append((name: fileName, data: data!))
            return true
        }
        
        func fileExists(atPath path: String) -> Bool {
            true
        }

        func contentsOfDirectory(at url: URL) throws -> [URL] {
            []
        }
        
        func removeItem(at url: URL) throws {
            itemsRemoved.append(url.path)
        }
    }
    
    @MainActor
    private class Printer {
        private(set) var printedLogs = [String]()
        
        func print(string: String) {
            DispatchQueue.main.async {
                self.printedLogs.append(string)
            }
        }
    }
    
    @MainActor static let loadFile: (URL) throws -> Data = { _ in
        Data("<!--\n{\"identifier\": \"/documentation/AppStoreConnectAPI/Test\", \"title\": \"Test\"}\n-->\n# Test\n\nTest documentation.".utf8)
    }
}
