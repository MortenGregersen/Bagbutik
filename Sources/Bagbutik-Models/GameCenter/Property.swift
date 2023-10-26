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
}
