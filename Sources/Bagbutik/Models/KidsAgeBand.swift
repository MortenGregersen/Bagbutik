import Foundation

/**
 # KidsAgeBand
 String that represents a Made for Kids app's age band.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/kidsageband>
 */
public enum KidsAgeBand: String, Codable, CaseIterable {
    /// A literal that represents the age band for ages 5 and under.
    case fiveAndUnder = "FIVE_AND_UNDER"
    /// A literal that represents the age band for ages 6 to 8.
    case sixToEight = "SIX_TO_EIGHT"
    /// A literal that represents the age band for ages 9 to 11.
    case nineToEleven = "NINE_TO_ELEVEN"
}
