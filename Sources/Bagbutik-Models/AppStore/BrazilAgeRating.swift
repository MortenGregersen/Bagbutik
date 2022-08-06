import Bagbutik_Core
import Foundation

/**
 # BrazilAgeRating
 String that represents the app's age rating as it appears on the App Store in Brazil for all platforms.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/brazilagerating>
 */
public enum BrazilAgeRating: String, Codable, CaseIterable {
    /// A literal that represents the rating L.
    case l = "L"
    /// A literal that represents the rating 10.
    case ten = "TEN"
    /// A literal that represents the rating 12.
    case twelve = "TWELVE"
    /// A literal that represents the rating 14.
    case fourteen = "FOURTEEN"
    /// A literal that represents the rating 16.
    case sixteen = "SIXTEEN"
    /// A literal that represents the rating 18.
    case eighteen = "EIGHTEEN"
}
