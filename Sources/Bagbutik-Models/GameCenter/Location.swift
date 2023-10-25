import Bagbutik_Core
import Foundation

/**
 # Location
 A representation of a device location.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/location>
 */
public struct Location: Codable {
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
}
