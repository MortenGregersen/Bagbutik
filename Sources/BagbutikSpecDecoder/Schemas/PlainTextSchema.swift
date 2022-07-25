import Foundation

/// A representation of plain text
public struct PlainTextSchema: Decodable, Equatable {
    /// The name of the object
    public let name: String
    /// An url for the documentation for the object
    public let url: String?
    /// The documentation for the obejct - if any
    public var documentation: ObjectDocumentation?
    
    private enum CodingKeys: CodingKey {
        case type
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
