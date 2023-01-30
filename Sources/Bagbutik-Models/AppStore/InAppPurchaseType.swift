import Bagbutik_Core
import Foundation

public enum InAppPurchaseType: String, ParameterValue, Codable, CaseIterable {
    case consumable = "CONSUMABLE"
    case nonConsumable = "NON_CONSUMABLE"
    case nonRenewingSubscription = "NON_RENEWING_SUBSCRIPTION"
}
