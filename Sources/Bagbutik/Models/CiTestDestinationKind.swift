import Foundation

/**
 # CiTestDestinationKind
 The string that represents the kind of a test destination.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citestdestinationkind>
 */
public enum CiTestDestinationKind: String, Codable, CaseIterable {
    /// The test destination is a simulated device.
    case simulator = "SIMULATOR"
    /// The test destination is a Mac.
    case mac = "MAC"
}
