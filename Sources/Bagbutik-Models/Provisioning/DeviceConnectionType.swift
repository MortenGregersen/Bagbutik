import Bagbutik_Core
import Foundation

public enum DeviceConnectionType: String, Sendable, Codable, CaseIterable {
    case mobileData = "MOBILE_DATA"
    case none = "NONE"
    case unknown = "UNKNOWN"
    case wifi = "WIFI"
    case wire = "WIRE"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = DeviceConnectionType(rawValue: string) {
            self = value
        } else if let value = DeviceConnectionType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid DeviceConnectionType value: \(string)"
            )
        }
    }
}
