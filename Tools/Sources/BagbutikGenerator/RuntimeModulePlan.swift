import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// The model module assignment used while the version 24 graph is migrated one product at a time.
public struct RuntimeModulePlan: Sendable {
    public enum ModelModule: Hashable, Sendable {
        case core
        case modelsShared
        case domainModels(PackageName)
        case legacyModels

        public var targetName: String {
            switch self {
            case .core: "BagbutikCore"
            case .modelsShared: "BagbutikModelsShared"
            case .domainModels(let package): "Bagbutik\(package.docsSectionName)Models"
            case .legacyModels: "Bagbutik-Models"
            }
        }
    }

    public let moduleBySchema: [String: ModelModule]
    public let dependenciesByModule: [ModelModule: Set<ModelModule>]

    /// Creates version 24 vertical slices from schema ownership and actual references.
    public init(
        graph: SchemaReferenceGraph,
        packageBySchema: [String: PackageName],
        migratedPackages: Set<PackageName>,
        sharedSchemas: Set<String> = [],
        additionalRootsByPackage: [PackageName: Set<String>] = [:]
    ) {
        let coreSchemas = Set(packageBySchema.compactMap { entry -> String? in
            guard entry.value == .core,
                  !Self.isLinkageSchema(entry.key) else { return nil }
            return entry.key
        })
        let schemasByPackage = migratedPackages.reduce(into: [PackageName: Set<String>]()) { result, package in
            result[package] = Set(packageBySchema.compactMap { $0.value == package ? $0.key : nil })
                .union(additionalRootsByPackage[package, default: []])
        }
        let closureByPackage = schemasByPackage.mapValues { graph.closure(startingAt: $0) }
        let migratedClosure = closureByPackage.values.reduce(into: Set<String>()) { $0.formUnion($1) }

        var assignments = graph.references.keys.reduce(into: [String: ModelModule]()) { result, schema in
            if coreSchemas.contains(schema) {
                result[schema] = .core
            } else if migratedClosure.contains(schema) {
                let usingPackages = migratedPackages.filter { closureByPackage[$0, default: []].contains(schema) }
                if sharedSchemas.contains(schema) {
                    result[schema] = .modelsShared
                } else if let owner = packageBySchema[schema], migratedPackages.contains(owner) {
                    result[schema] = .domainModels(owner)
                } else if Self.isLinkageSchema(schema), usingPackages.count == 1, let package = usingPackages.first {
                    result[schema] = .domainModels(package)
                } else {
                    result[schema] = .modelsShared
                }
            } else {
                result[schema] = .legacyModels
            }
        }

        for component in graph.stronglyConnectedComponents() {
            let modules = Set(component.schemas.compactMap { assignments[$0] })
                .subtracting([.legacyModels])
            guard modules.count > 1 else { continue }
            let collapsedModule: ModelModule = modules.contains(.core) ? .core : .modelsShared
            for schema in component.schemas where assignments[schema] != .legacyModels {
                assignments[schema] = collapsedModule
            }
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
        for package in migratedPackages {
            dependencies[.domainModels(package), default: []].formUnion([.core, .modelsShared])
        }
        for (schema, references) in graph.references {
            guard let sourceModule = assignments[schema], sourceModule != .legacyModels else { continue }
            for reference in references {
                guard let dependencyModule = assignments[reference],
                      dependencyModule != sourceModule,
                      dependencyModule != .legacyModels else { continue }
                dependencies[sourceModule, default: []].insert(dependencyModule)
            }
        }
        dependenciesByModule = dependencies
    }

    public subscript(schemaName: String) -> ModelModule {
        moduleBySchema[schemaName, default: .legacyModels]
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
