import Foundation

/**
 # IntegerRange
 Describe the upper and lower integer bound of the attribute.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/integerrange>
 */
public struct IntegerRange: Codable, Sendable {
    public var maximum: Int?
    public var minimum: Int?

    public init(maximum: Int? = nil,
                minimum: Int? = nil)
    {
        self.maximum = maximum
        self.minimum = minimum
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        maximum = try container.decodeIfPresent(Int.self, forKey: "maximum")
        minimum = try container.decodeIfPresent(Int.self, forKey: "minimum")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(maximum, forKey: "maximum")
        try container.encodeIfPresent(minimum, forKey: "minimum")
    }
}
