import Bagbutik_Core
import Foundation

public enum SubscriptionOfferMode: String, Sendable, Codable, CaseIterable {
    case freeTrial = "FREE_TRIAL"
    case payAsYouGo = "PAY_AS_YOU_GO"
    case payUpFront = "PAY_UP_FRONT"
}
