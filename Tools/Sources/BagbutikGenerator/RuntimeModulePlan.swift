import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// Assigns every generated schema to its final model module.
public struct RuntimeModulePlan: Sendable {
    public enum ModelModule: Hashable, Sendable {
        case core
        case modelsShared
        case domainModels(PackageName)

        public var targetName: String {
            switch self {
            case .core: "BagbutikCore"
            case .modelsShared: "BagbutikModelsShared"
            case .domainModels(let package): "Bagbutik\(package.docsSectionName)Models"
            }
        }

    }

    public let moduleBySchema: [String: ModelModule]
    public let dependenciesByModule: [ModelModule: Set<ModelModule>]

    /// Creates version 24 model assignments from schema ownership and endpoint references.
    public init(
        graph: SchemaReferenceGraph,
        packageBySchema: [String: PackageName],
        sharedSchemas: Set<String> = [],
        additionalRootsByPackage: [PackageName: Set<String>] = [:]
    ) {
        let coreSchemas = Set(packageBySchema.compactMap { entry -> String? in
            guard entry.value == .core,
                  !Self.isLinkageSchema(entry.key) else { return nil }
            return entry.key
        })
        let closureByPackage = additionalRootsByPackage.mapValues { graph.closure(startingAt: $0) }

        var assignments = graph.references.keys.reduce(into: [String: ModelModule]()) { result, schema in
            if coreSchemas.contains(schema) {
                result[schema] = .core
            } else if sharedSchemas.contains(schema) {
                result[schema] = .modelsShared
            } else if let owner = packageBySchema[schema], owner != .core {
                result[schema] = .domainModels(owner)
            } else if Self.isLinkageSchema(schema) {
                let usingPackages = closureByPackage.compactMap { package, closure in
                    closure.contains(schema) ? package : nil
                }
                result[schema] = usingPackages.count == 1
                    ? .domainModels(usingPackages[0])
                    : .modelsShared
            } else {
                result[schema] = .core
            }
        }

        for component in graph.stronglyConnectedComponents() {
            let modules = Set(component.schemas.compactMap { assignments[$0] })
            guard modules.count > 1 else { continue }
            let collapsedModule: ModelModule = modules.contains(.core) ? .core : .modelsShared
            for schema in component.schemas { assignments[schema] = collapsedModule }
        }

        var pendingSharedSchemas = assignments.compactMap { schema, module in
            module == .modelsShared ? schema : nil
        }
        while let schema = pendingSharedSchemas.popLast() {
            for dependency in graph.references[schema, default: []] {
                guard case .domainModels = assignments[dependency] else { continue }
                assignments[dependency] = .modelsShared
                pendingSharedSchemas.append(dependency)
            }
        }

        moduleBySchema = assignments

        var dependencies: [ModelModule: Set<ModelModule>] = [
            .modelsShared: [.core],
        ]
        for package in PackageName.allCases where package != .core {
            dependencies[.domainModels(package), default: []].formUnion([.core, .modelsShared])
        }
        for (schema, references) in graph.references {
            guard let sourceModule = assignments[schema] else { continue }
            for reference in references {
                guard let dependencyModule = assignments[reference],
                      dependencyModule != sourceModule else { continue }
                dependencies[sourceModule, default: []].insert(dependencyModule)
            }
        }
        dependenciesByModule = dependencies
    }

    public subscript(schemaName: String) -> ModelModule {
        moduleBySchema[schemaName, default: .modelsShared]
    }

    public func dependencies(for module: ModelModule) -> Set<ModelModule> {
        dependenciesByModule[module, default: []]
    }

    private static func isLinkageSchema(_ schema: String) -> Bool {
        schema.hasSuffix("LinkageRequest")
            || schema.hasSuffix("LinkagesRequest")
            || schema.hasSuffix("LinkageResponse")
            || schema.hasSuffix("LinkagesResponse")
    }
}
