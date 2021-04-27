import Foundation

/// String that represents the app’s age rating as it will appear on the App Store for all platforms.
public enum AppStoreAgeRating: String, Codable, CaseIterable {
    case fourPlus = "FOUR_PLUS"
    case ninePlus = "NINE_PLUS"
    case twelvePlus = "TWELVE_PLUS"
    case seventeenPlus = "SEVENTEEN_PLUS"
}
