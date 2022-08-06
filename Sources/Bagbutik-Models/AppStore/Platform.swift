import Bagbutik_Core
import Foundation

/**
 # Platform
 Strings that represent Apple operating systems.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/platform>
 */
public enum Platform: String, Codable, CaseIterable {
    /// A string that represents iOS.
    case iOS = "IOS"
    /// A string that represents macOS.
    case macOS = "MAC_OS"
    /// A string that represents tvOS.
    case tvOS = "TV_OS"
}
