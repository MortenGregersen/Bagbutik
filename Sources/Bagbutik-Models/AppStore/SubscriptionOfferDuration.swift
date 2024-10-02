import Bagbutik_Core
import Foundation

public enum SubscriptionOfferDuration: String, Sendable, Codable, CaseIterable {
    case oneMonth = "ONE_MONTH"
    case oneWeek = "ONE_WEEK"
    case oneYear = "ONE_YEAR"
    case sixMonths = "SIX_MONTHS"
    case threeDays = "THREE_DAYS"
    case threeMonths = "THREE_MONTHS"
    case twoMonths = "TWO_MONTHS"
    case twoWeeks = "TWO_WEEKS"
}
