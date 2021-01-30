import Foundation

public struct EnumSchema: Decodable {
    public let type: String
    public let cases: [EnumCase]
    public let name: String

    enum CodingKeys: String, CodingKey {
        case type
        case `enum`
    }

    public init(type: String, values: [String], name: String) {
        self.type = type
        self.cases = values.map { EnumCase(id: $0.camelCased(with: "_"), value: $0) }
        self.name = name
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(type: try container.decode(String.self, forKey: .type),
                  values: try container.decode([String].self, forKey: .enum),
                  name: container.codingPath.last!.stringValue.capitalizingFirstLetter())
    }
}
