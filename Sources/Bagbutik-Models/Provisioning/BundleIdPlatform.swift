import Bagbutik_Core
import Foundation

public enum BundleIdPlatform: String, Sendable, Codable, CaseIterable {
    case iOS = "IOS"
    case macOS = "MAC_OS"
    case services = "SERVICES"
    case universal = "UNIVERSAL"
}
