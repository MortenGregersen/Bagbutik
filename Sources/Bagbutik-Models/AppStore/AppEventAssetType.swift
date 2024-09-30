import Bagbutik_Core
import Foundation

public enum AppEventAssetType: String, Sendable, Codable, CaseIterable {
    case eventCard = "EVENT_CARD"
    case eventDetailsPage = "EVENT_DETAILS_PAGE"
}
