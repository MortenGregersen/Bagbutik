import Bagbutik_Core
import Foundation

/**
 # Location
 A representation of a device location.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/location>
 */
public struct Location: Codable, Sendable {
    /// The latitude of the location.
    public var latitude: Double?
    /// The longitude of the location.
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
