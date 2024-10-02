import Bagbutik_Core
import Foundation

public struct Location: Codable, Sendable {
    public var latitude: Double?
    public var longitude: Double?

    public init(latitude: Double? = nil,
                longitude: Double? = nil)
    {
        self.latitude = latitude
        self.longitude = longitude
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        latitude = try container.decodeIfPresent(Double.self, forKey: "latitude")
        longitude = try container.decodeIfPresent(Double.self, forKey: "longitude")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(latitude, forKey: "latitude")
        try container.encodeIfPresent(longitude, forKey: "longitude")
    }
}
