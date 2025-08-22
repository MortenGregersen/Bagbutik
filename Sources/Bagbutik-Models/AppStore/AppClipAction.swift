import Bagbutik_Core
import Foundation

public enum AppClipAction: String, Sendable, ParameterValue, Codable, CaseIterable {
    case open = "OPEN"
    case play = "PLAY"
    case view = "VIEW"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppClipAction(rawValue: string) {
            self = value
        } else if let value = AppClipAction(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppClipAction value: \(string)"
            )
        }
    }
}
