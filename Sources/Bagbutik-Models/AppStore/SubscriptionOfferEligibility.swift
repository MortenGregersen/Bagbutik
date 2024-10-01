import Bagbutik_Core
import Foundation

public enum SubscriptionOfferEligibility: String, Sendable, Codable, CaseIterable {
    case replaceIntroOffers = "REPLACE_INTRO_OFFERS"
    case stackWithIntroOffers = "STACK_WITH_INTRO_OFFERS"
}
