import Bagbutik_Core
import Foundation

/**
 # SubscriptionOfferMode
 A string that indicates the payment mode of a subscription offer.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionoffermode>
 */
public enum SubscriptionOfferMode: String, Codable, CaseIterable {
    /// A constant that indicates a subscription offer is billed over multiple billing periods.
    case payAsYouGo = "PAY_AS_YOU_GO"
    /// A constant that indicates a subscription offer is billed one time, up front.
    case payUpFront = "PAY_UP_FRONT"
    /// A constant that indicates a subscription offer is a free trial.
    case freeTrial = "FREE_TRIAL"
}
