import Foundation
import Bagbutik_Core

public enum InAppPurchaseType: String, Codable, CaseIterable {
    case consumable = "CONSUMABLE"
    case nonConsumable = "NON_CONSUMABLE"
    case nonRenewingSubscription = "NON_RENEWING_SUBSCRIPTION"
}
