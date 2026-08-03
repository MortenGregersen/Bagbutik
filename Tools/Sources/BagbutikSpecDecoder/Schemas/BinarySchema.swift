import Foundation

/// A representation of binary data
public struct BinarySchema: Decodable, Equatable, Sendable {
    /// The name of the object
    public let name: String
    /// An url for the documentation for the object
    public let url: String?
    
    private enum CodingKeys: String, CodingKey {
        case type
        case format
    }
    
    internal init(name: String, url: String?) {
        self.name = name
        self.url = url
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = container.codingPath.last!.stringValue.capitalizingFirstLetter()
        self.init(name: name, url: createDocumentationUrl(forSchemaNamed: name, withCodingPathComponents: container.codingPath.components))
    }
}
