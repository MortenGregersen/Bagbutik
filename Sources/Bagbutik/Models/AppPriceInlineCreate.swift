import Foundation

public struct AppPriceInlineCreate: Codable {
    public let id: String?
    public var type: String { "appPrices" }

    public init(id: String? = nil) {
        self.id = id
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(type, forKey: .type)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case type
    }
}
