import Foundation
import Bagbutik_Core

public enum SubscriptionCustomerEligibility: String, Codable, CaseIterable {
    case new = "NEW"
    case existing = "EXISTING"
    case expired = "EXPIRED"
}
