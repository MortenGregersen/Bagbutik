import Foundation

public enum BuildAudienceType: String, Codable, CaseIterable {
    case internalOnly = "INTERNAL_ONLY"
    case appStoreEligible = "APP_STORE_ELIGIBLE"
}
