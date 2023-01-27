import Bagbutik_Core
import Foundation

public enum InAppPurchaseType: String, ParameterValue, CaseIterable {
    case consumable = "CONSUMABLE"
    case nonConsumable = "NON_CONSUMABLE"
    case nonRenewingSubscription = "NON_RENEWING_SUBSCRIPTION"
}
