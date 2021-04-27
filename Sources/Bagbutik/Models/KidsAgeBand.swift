import Foundation

/// String that represents a Made for Kids app's age band.
public enum KidsAgeBand: String, Codable, CaseIterable {
    case fiveAndUnder = "FIVE_AND_UNDER"
    case sixToEight = "SIX_TO_EIGHT"
    case nineToEleven = "NINE_TO_ELEVEN"
}
