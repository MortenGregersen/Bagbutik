import Foundation

public enum Platform: String, Sendable, ParameterValue, Codable, CaseIterable {
    case iOS = "IOS"
    case macOS = "MAC_OS"
    case tvOS = "TV_OS"
    case visionOS = "VISION_OS"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = Platform(rawValue: string) {
            self = value
        } else if let value = Platform(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid Platform value: \(string)"
            )
        }
    }
}
