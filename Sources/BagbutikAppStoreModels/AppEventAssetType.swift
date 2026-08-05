import BagbutikCore
import BagbutikMarketplacesModels
import BagbutikModelsShared
import BagbutikTestFlightModels
import BagbutikXcodeCloudModels
import Foundation

public enum AppEventAssetType: String, Sendable, Codable, CaseIterable {
    case eventCard = "EVENT_CARD"
    case eventDetailsPage = "EVENT_DETAILS_PAGE"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppEventAssetType(rawValue: string) {
            self = value
        } else if let value = AppEventAssetType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppEventAssetType value: \(string)"
            )
        }
    }
}
