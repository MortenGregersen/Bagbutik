import Bagbutik_Core
import Foundation

public enum DeviceFamily: String, Sendable, ParameterValue, Codable, CaseIterable {
    case appleTV = "APPLE_TV"
    case appleWatch = "APPLE_WATCH"
    case iPad = "IPAD"
    case iPhone = "IPHONE"
    case mac = "MAC"
    case vision = "VISION"
}
