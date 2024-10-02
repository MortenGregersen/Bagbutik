import Bagbutik_Core
import Foundation

public enum AppStoreAgeRating: String, Sendable, Codable, CaseIterable {
    case fourPlus = "FOUR_PLUS"
    case ninePlus = "NINE_PLUS"
    case seventeenPlus = "SEVENTEEN_PLUS"
    case twelvePlus = "TWELVE_PLUS"
    case unrated = "UNRATED"
}
