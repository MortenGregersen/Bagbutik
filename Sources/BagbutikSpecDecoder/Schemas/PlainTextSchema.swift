import Foundation

/// A representation of plain text
public struct PlainTextSchema: Decodable, Equatable {
    /// The name of the object
    public let name: String
    /// An url for the documentation for the object
    public let url: String?
    /// The documentation for the obejct - if any
    public let documentation: Schema.Documentation?
    
    private enum CodingKeys: CodingKey {
        case type
    }
    
    internal init(name: String, url: String?, lookupDocumentation: (String) -> Schema.Documentation?) {
        self.name = name
        self.url = url
        self.documentation = lookupDocumentation(name)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = container.codingPath.last!.stringValue.capitalizingFirstLetter()
        let type = try container.decode(String.self, forKey: .type)
        guard type == "string" else {
            throw DecodingError.dataCorruptedError(forKey: CodingKeys.type, in: container, debugDescription: "Schema type is not 'string'")
        }
        self.init(name: name,
                  url: createDocumentationUrl(forSchemaNamed: name, withCodingPathComponents: container.codingPath.components),
                  lookupDocumentation: Schema.Documentation.lookupDocumentation)
    }
}
