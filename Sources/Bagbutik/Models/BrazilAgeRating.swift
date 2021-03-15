import Foundation

/// String that represents the app's age rating as it will appear on the App Store in Brazil for all platforms.
public enum BrazilAgeRating: String, Codable, CaseIterable {
    case l = "L"
    case ten = "TEN"
    case twelve = "TWELVE"
    case fourteen = "FOURTEEN"
    case sixteen = "SIXTEEN"
    case eighteen = "EIGHTEEN"
}
