import Bagbutik_Core
import Foundation

public enum DeviceConnectionType: String, Sendable, Codable, CaseIterable {
    case mobileData = "MOBILE_DATA"
    case none = "NONE"
    case unknown = "UNKNOWN"
    case wifi = "WIFI"
    case wire = "WIRE"
}
