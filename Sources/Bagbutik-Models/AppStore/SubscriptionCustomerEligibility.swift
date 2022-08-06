import Bagbutik_Core
import Foundation

public enum SubscriptionCustomerEligibility: String, Codable, CaseIterable {
    case new = "NEW"
    case existing = "EXISTING"
    case expired = "EXPIRED"
}
