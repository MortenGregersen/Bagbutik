import Bagbutik_Core
import Foundation

public enum IconAssetType: String, Sendable, Codable, CaseIterable {
    case alternateExperiment = "ALTERNATE_EXPERIMENT"
    case appStore = "APP_STORE"
    case messagesAppStore = "MESSAGES_APP_STORE"
    case tvOSHomeScreen = "TV_OS_HOME_SCREEN"
    case tvOSTopShelf = "TV_OS_TOP_SHELF"
    case watchAppStore = "WATCH_APP_STORE"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = IconAssetType(rawValue: string) {
            self = value
        } else if let value = IconAssetType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid IconAssetType value: \(string)"
            )
        }
    }
}
