import Bagbutik_Core
import Foundation

public enum BuildAudienceType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case appStoreEligible = "APP_STORE_ELIGIBLE"
    case internalOnly = "INTERNAL_ONLY"
}
