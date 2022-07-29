import Foundation

/**
 # BundleIdPlatform
 Strings that represent the operating system intended for the bundle.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidplatform>
 */
public enum BundleIdPlatform: String, Codable, CaseIterable {
    /// A string that represents iOS.
    case iOS = "IOS"
    /// A string that represents macOS.
    case macOS = "MAC_OS"
    /// A string that represents iOS and macOS.
    case universal = "UNIVERSAL"
}
