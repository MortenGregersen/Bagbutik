import Bagbutik_Core
import Foundation

public enum SubscriptionCustomerEligibility: String, Codable, CaseIterable {
    case existing = "EXISTING"
    case expired = "EXPIRED"
    case new = "NEW"
}
