import Bagbutik_Core
import Foundation

public enum SubscriptionGracePeriodDuration: String, Codable, CaseIterable {
    case threeDays = "THREE_DAYS"
    case sixteenDays = "SIXTEEN_DAYS"
    case twentyEightDays = "TWENTY_EIGHT_DAYS"
}
