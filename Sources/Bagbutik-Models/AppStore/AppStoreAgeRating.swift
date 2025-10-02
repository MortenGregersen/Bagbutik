import Bagbutik_Core
import Foundation

public enum AppStoreAgeRating: String, Sendable, Codable, CaseIterable {
    case all = "ALL"
    case eightPlus = "EIGHT_PLUS"
    case eighteenPlus = "EIGHTEEN_PLUS"
    case elevenPlus = "ELEVEN_PLUS"
    case fifteenPlus = "FIFTEEN_PLUS"
    case fivePlus = "FIVE_PLUS"
    case fourPlus = "FOUR_PLUS"
    case fourteenPlus = "FOURTEEN_PLUS"
    case l = "L"
    case ninePlus = "NINE_PLUS"
    case nineteenPlus = "NINETEEN_PLUS"
    case onePlus = "ONE_PLUS"
    case sevenPlus = "SEVEN_PLUS"
    case seventeenPlus = "SEVENTEEN_PLUS"
    case sixPlus = "SIX_PLUS"
    case sixteenPlus = "SIXTEEN_PLUS"
    case tenPlus = "TEN_PLUS"
    case thirteenPlus = "THIRTEEN_PLUS"
    case threePlus = "THREE_PLUS"
    case twelvePlus = "TWELVE_PLUS"
    case twentyOnePlus = "TWENTY_ONE_PLUS"
    case twentyPlus = "TWENTY_PLUS"
    case twoPlus = "TWO_PLUS"
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
