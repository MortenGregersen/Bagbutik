import Bagbutik_Core
import Foundation

/**
 # AppStoreAgeRating
 String that represents the app’s age rating as it appears on the App Store for all platforms.

 For more information about app ratings, see [Age ratings](https://developer.apple.com/help/app-store-connect/reference/age-ratings).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreagerating>
 */
public enum AppStoreAgeRating: String, Codable, CaseIterable {
    /// A literal that represents the app rating 4+.
    case fourPlus = "FOUR_PLUS"
    /// A literal that represents the app rating 9+.
    case ninePlus = "NINE_PLUS"
    /// A literal that represents the app rating 12+.
    case twelvePlus = "TWELVE_PLUS"
    /// A literal that represents the app rating 17+.
    case seventeenPlus = "SEVENTEEN_PLUS"
}
