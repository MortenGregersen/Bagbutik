import Bagbutik_Core
import Foundation

public enum DeviceFamily: String, Sendable, ParameterValue, Codable, CaseIterable {
    case appleTV = "APPLE_TV"
    case appleWatch = "APPLE_WATCH"
    case iPad = "IPAD"
    case iPhone = "IPHONE"
    case mac = "MAC"
    case vision = "VISION"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = DeviceFamily(rawValue: string) {
            self = value
        } else if let value = DeviceFamily(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid DeviceFamily value: \(string)"
            )
        }
    }
}
