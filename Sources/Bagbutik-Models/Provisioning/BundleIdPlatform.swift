import Bagbutik_Core
import Foundation

public enum BundleIdPlatform: String, Sendable, ParameterValue, Codable, CaseIterable {
    case iOS = "IOS"
    case macOS = "MAC_OS"
    case services = "SERVICES"
    case universal = "UNIVERSAL"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BundleIdPlatform(rawValue: string) {
            self = value
        } else if let value = BundleIdPlatform(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BundleIdPlatform value: \(string)"
            )
        }
    }
}
