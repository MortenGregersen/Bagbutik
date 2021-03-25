import Foundation

public struct EnumSchema: Decodable, Equatable {
    public let name: String
    public let type: String
    public let documentation: Schema.Documentation?
    public let cases: [EnumCase]

    enum CodingKeys: String, CodingKey {
        case type
        case `enum`
    }

    public init(name: String, type: String, values: [String]) {
        self.init(name: name, type: type, values: values, lookupDocumentation: Schema.Documentation.lookupDocumentation)
    }
    
    internal init(name: String, type: String, values: [String], lookupDocumentation: (String) -> Schema.Documentation?) {
        self.type = type
        self.name = name
        let documentation = lookupDocumentation(name)
        self.documentation = documentation
        let cases = values.map {
            EnumCase(id: $0.camelCased(with: "_"), value: $0, documentation: documentation?.properties[$0])
        }
        if name == "BundleIdPlatform" {
            // HACK: Apple's OpenAPI spec doesn't include 'Universal' App IDs. Reported to Apple 21/1/21 as FB8977648.
            self.cases = cases + [
                EnumCase(id: "universal", value: "UNIVERSAL", documentation: "A string that represents iOS and macOS."),
            ]
        } else {
            self.cases = cases
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(name: container.codingPath.last!.stringValue.capitalizingFirstLetter(),
                  type: try container.decode(String.self, forKey: .type),
                  values: try container.decode([String].self, forKey: .enum))
    }
}
