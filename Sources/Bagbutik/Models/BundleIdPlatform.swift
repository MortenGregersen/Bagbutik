import Foundation

/// Strings that represent the operating system intended for the bundle.
public enum BundleIdPlatform: String, Codable, CaseIterable {
    /// A string that represents iOS.
    case iOS = "IOS"
    /// A string that represents macOS.
    case macOS = "MAC_OS"
    /// A string that represents iOS and macOS.
    case universal = "UNIVERSAL"
}
