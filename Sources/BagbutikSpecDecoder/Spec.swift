import Foundation

/// A representation of the spec file
public struct Spec: Decodable {
    /// The paths contained in the spec
    public let paths: [String: Path]
    /// The components contained in the spec
    public let components: Components
    /// Fix ups for the includes parameter of a path
    public var includesFixUps: [String: [String]] {
        paths.values.reduce(into: [:]) { result, path in
            path.operations.forEach { operation in
                let fields = operation.parameters?.compactMap { parameter -> String? in
                    guard case .fields(let name, _, _) = parameter else { return nil }
                    return name
                } ?? []
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
