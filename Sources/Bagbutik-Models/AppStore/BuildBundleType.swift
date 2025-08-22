import Bagbutik_Core
import Foundation

public enum BuildBundleType: String, Sendable, Codable, CaseIterable {
    case app = "APP"
    case appClip = "APP_CLIP"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BuildBundleType(rawValue: string) {
            self = value
        } else if let value = BuildBundleType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BuildBundleType value: \(string)"
            )
        }
    }
}
