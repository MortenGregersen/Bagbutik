import Foundation

/// An endpoint path
public struct Path: Decodable, Sendable {
    /// The raw path
    public let path: String
    /// Type info about the path
    public let info: Info
    /// Operations available on the path
    public var operations: [Operation]
    /// Path parameters
    public let parameters: [Parameter]?
    private static let methodKeys: [CodingKeys] = [.get, .patch, .post, .delete]

    private enum CodingKeys: String, CodingKey {
        case get
        case patch
        case post
        case delete
        case parameters
    }

    /**
     Initialize a new path

     - Parameters:
        - path: The raw path
        - info: Type info about the path
        - operations: Operations available on the path
        - parameters: Path parameters
     */
    public init(path: String, info: Info, operations: [Operation], parameters: [Parameter]? = nil) {
        self.path = path
        self.info = info
        self.operations = operations
        self.parameters = parameters
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let path = container.codingPath.last!.stringValue
        let operations = try Self.methodKeys.compactMap { try container.decodeIfPresent(Operation.self, forKey: $0) }
        let parameters = try container.decodeIfPresent([Parameter].self, forKey: .parameters)

        let pathComponents = path.components(separatedBy: "/")
        guard let version = pathComponents.first(where: { $0.count == 2 && $0[$0.startIndex].lowercased() == "v" }) else {
            throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Version not found in path '\(path)'"))
        }
        let mainType = pathComponents
            .first { $0 != version && $0 != "" }!
            .capitalizingFirstLetter()
            .singularized()
        let isRelationship = pathComponents.count > 4
        let info = Info(mainType: mainType, version: version.capitalizingFirstLetter(), isRelationship: isRelationship)
        self.init(path: path, info: info, operations: operations, parameters: parameters)
    }

    /// Type info about a path
    public struct Info: Equatable, Sendable {
        /// The main type of the path
        public let mainType: String
        /// The version of the path
        public let version: String
        /// Is the path accessing a relationship
        public let isRelationship: Bool
    }

    /// A parameter for a path
    public struct Parameter: Decodable, Equatable, Sendable {
        /// The name of the paramter
        public let name: String
        /// A short description of what the parameter is
        public let description: String
    }
}
