import Foundation

/**
   String that represents the app’s age rating as it appears on the App Store for all platforms.

   Full documentation:
   <https://developer.apple.com/documentation/appstoreconnectapi/appstoreagerating>

   For more information about app ratings, see [App ratings](https://help.apple.com/app-store-connect/#/dev269f11291).
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
