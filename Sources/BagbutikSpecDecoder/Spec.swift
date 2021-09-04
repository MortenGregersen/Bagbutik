import Foundation

/// A representation of the spec file
public struct Spec: Decodable {
    /// The paths contained in the spec
    public let paths: [String: Path]
    /// The components contained in the spec
    public let components: Components
    /// Fix ups for the includes on the schemas based the field parameters of a the path operations
    public var includesFixUps: [String: [String]] {
        paths.values.reduce(into: [:]) { result, path in
            guard path.path == "/v1/appStoreVersions/{id}/appStoreVersionLocalizations" else { return }
            path.operations.forEach { operation in
                let fields = operation.parameters?.compactMap { parameter -> [String]? in
                    guard case .fields(let paramName, let type, _, _) = parameter else { return nil }
                    let paramNameOverrides = ["appPrices": "prices", "ciBuildRuns": "buildRuns", "ciWorkflows": "workflows"]
                    let name = paramNameOverrides[paramName] ?? paramName
                    if let lastSlashIndex = path.path.lastIndex(of: "/"),
                       name == path.path.suffix(from: path.path.index(after: lastSlashIndex)),
                       case .enum(_, let values) = type
                    {
                        return values
                    }
                    return [name]
                }.flatMap { $0 } ?? []
                let includesValues = operation.parameters?.compactMap { parameter -> [String]? in
                    guard case .include(let type) = parameter,
                          case .enum(_, let values) = type else { return nil }
                    return values
                }.flatMap { $0 } ?? []
                let allFixUps = fields + includesValues
                guard allFixUps.count > 0 else { return }
                let currentFixUps = result[operation.successResponseType] ?? []
                result[operation.successResponseType] = currentFixUps + allFixUps
            }
        }
    }

    /// A wrapper for schemas to ease decoding
    public struct Components: Decodable {
        /// A list of schema names and their representation
        public let schemas: [String: Schema]
    }
}
