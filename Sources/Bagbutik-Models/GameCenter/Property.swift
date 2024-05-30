import Bagbutik_Core
import Foundation

/**
 # Property
 A representation of a game-specific property.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/property>
 */
public struct Property: Codable {
    /// The name of the property.
    public var key: String?
    /// The value for the property.
    public var value: String?

    public init(key: String? = nil,
                value: String? = nil)
    {
        self.key = key
        self.value = value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        key = try container.decodeIfPresent(String.self, forKey: .key)
        value = try container.decodeIfPresent(String.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(key, forKey: .key)
        try container.encodeIfPresent(value, forKey: .value)
    }

    private enum CodingKeys: String, CodingKey {
        case key
        case value
    }
}
