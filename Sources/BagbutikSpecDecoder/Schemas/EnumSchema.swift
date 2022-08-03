import Foundation

/// A representation of an enum
public struct EnumSchema: Decodable, Equatable {
    /// The name of the enum
    public let name: String
    /// The type of the value of the enum's cases
    public let type: String
    /// An url for the documentation for the enum
    public let url: String?
    /// The enum's cases
    public let cases: [EnumCase]

    private enum CodingKeys: String, CodingKey {
        case type
        case `enum`
    }

    /**
     Initialize a new enum

     - Parameters:
        - name: The name of the enum
        - type: The type of the value of the enum's cases
        - url: An url for the documentation for the enum
        - caseValues: Values for the enum's cases
     */
    public init(name: String, type: String, url: String? = nil, caseValues: [String]) {
        self.name = name
        self.type = type
        self.url = url
        let cases = caseValues.map {
            EnumCase(id: $0.camelCased(with: "_"), value: $0)
        }
        if name == "BundleIdPlatform", !cases.contains(where: { $0.value == "UNIVERSAL" }) {
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
        var name = container.codingPath.last!.stringValue.capitalizingFirstLetter()
        if name == "Type" {
            var parentType = container.codingPath.dropLast(1).last!.stringValue
            if parentType == "properties" {
                // The codingPath on Linux has an extra layer ("Properties") which isn't present on macOS
                parentType = container.codingPath.dropLast(2).last!.stringValue
            }
            name = parentType.capitalizingFirstLetter() + name
        }
        self.init(name: name,
                  type: try container.decode(String.self, forKey: .type),
                  url: createDocumentationUrl(forSchemaNamed: name, withCodingPathComponents: container.codingPath.components),
                  caseValues: try container.decode([String].self, forKey: .enum))
    }
}
