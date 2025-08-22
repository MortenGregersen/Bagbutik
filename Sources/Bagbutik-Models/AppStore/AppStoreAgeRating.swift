import Bagbutik_Core
import Foundation

public enum AppStoreAgeRating: String, Sendable, Codable, CaseIterable {
    case fourPlus = "FOUR_PLUS"
    case ninePlus = "NINE_PLUS"
    case seventeenPlus = "SEVENTEEN_PLUS"
    case twelvePlus = "TWELVE_PLUS"
    case unrated = "UNRATED"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppStoreAgeRating(rawValue: string) {
            self = value
        } else if let value = AppStoreAgeRating(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppStoreAgeRating value: \(string)"
            )
        }
    }
}
