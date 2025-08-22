import Bagbutik_Core
import Foundation

public enum KidsAgeBand: String, Sendable, Codable, CaseIterable {
    case fiveAndUnder = "FIVE_AND_UNDER"
    case nineToEleven = "NINE_TO_ELEVEN"
    case sixToEight = "SIX_TO_EIGHT"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = KidsAgeBand(rawValue: string) {
            self = value
        } else if let value = KidsAgeBand(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid KidsAgeBand value: \(string)"
            )
        }
    }
}
