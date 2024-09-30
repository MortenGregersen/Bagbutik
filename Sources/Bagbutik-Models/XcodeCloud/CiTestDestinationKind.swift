import Bagbutik_Core
import Foundation

/**
 # CiTestDestinationKind
 The string that represents the kind of a test destination.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citestdestinationkind>
 */
public enum CiTestDestinationKind: String, Sendable, Codable, CaseIterable {
    /// The test destination is a Mac.
    case mac = "MAC"
    /// The test destination is a simulated device.
    case simulator = "SIMULATOR"
}
