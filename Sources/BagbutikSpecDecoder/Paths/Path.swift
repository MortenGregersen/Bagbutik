import Foundation

public struct Path: Decodable {
    public let path: String
    public let info: Info
    public let operations: [Operation]
    public let parameters: [PathParameter]?
    private static let methodKeys: [CodingKeys] = [.get, .patch, .post, .delete]

    private enum CodingKeys: String, CodingKey {
        case get
        case patch
        case post
        case delete
        case parameters
    }

    public init(path: String, info: Info, operations: [Operation], parameters: [PathParameter]? = nil) {
        self.path = path
        self.info = info
        self.operations = operations
        self.parameters = parameters
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let path = container.codingPath.last!.stringValue
        let operations = try Self.methodKeys.compactMap { try container.decodeIfPresent(Operation.self, forKey: $0) }
        let parameters = try container.decodeIfPresent([PathParameter].self, forKey: .parameters)

        let pathComponents = path.components(separatedBy: "/")
        let mainType = pathComponents.first { $0 != "v1" && $0 != "" }!.capitalizingFirstLetter()
        let isRelationship = pathComponents.count > 4
        let info = Info(mainType: mainType, isRelationship: isRelationship)
        self.init(path: path, info: info, operations: operations, parameters: parameters)
    }

    public struct Info {
        public let mainType: String
        public let isRelationship: Bool
    }
}
