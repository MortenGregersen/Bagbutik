import Foundation

public struct Spec: Decodable {
    public let paths: [String: BagbutikSpecDecoder.Path]
    public let components: Components
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

    public struct Components: Decodable {
        public let schemas: [String: Schema]
    }
}
