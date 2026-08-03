import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// The model module assignment used while the version 24 graph is migrated one product at a time.
public struct RuntimeModulePlan: Sendable {
    public enum ModelModule: String, Sendable {
        case core
        case modelsShared
        case usersModels
        case legacyModels
    }

    public let moduleBySchema: [String: ModelModule]

    /// Creates the first version 24 vertical slice from schema ownership and actual references.
    public init(usersSliceFrom graph: SchemaReferenceGraph, packageBySchema: [String: PackageName]) {
        let coreSchemas = Set(packageBySchema.compactMap { entry -> String? in
            guard entry.value == .core,
                  !entry.key.hasSuffix("LinkageRequest"),
                  !entry.key.hasSuffix("LinkagesRequest"),
                  !entry.key.hasSuffix("LinkageResponse"),
                  !entry.key.hasSuffix("LinkagesResponse") else { return nil }
            return entry.key
        })
        let userSchemas = Set(packageBySchema.compactMap { $0.value == .users ? $0.key : nil })
        let usersClosure = graph.closure(startingAt: userSchemas)
        var sharedSchemas = usersClosure.subtracting(coreSchemas).subtracting(userSchemas)
        var usersModelSchemas = usersClosure.intersection(userSchemas)

        for component in graph.stronglyConnectedComponents() where component.schemas.contains(where: usersClosure.contains) {
            let schemas = Set(component.schemas)
            if !schemas.isDisjoint(with: sharedSchemas) {
                sharedSchemas.formUnion(schemas.subtracting(coreSchemas))
                usersModelSchemas.subtract(schemas)
            }
        }

        moduleBySchema = graph.references.keys.reduce(into: [:]) { result, schema in
            if coreSchemas.contains(schema) {
                result[schema] = .core
            } else if sharedSchemas.contains(schema) {
                result[schema] = .modelsShared
            } else if usersModelSchemas.contains(schema) {
                result[schema] = .usersModels
            } else {
                result[schema] = .legacyModels
            }
        }
    }

    public subscript(schemaName: String) -> ModelModule {
        moduleBySchema[schemaName, default: .legacyModels]
    }
}
