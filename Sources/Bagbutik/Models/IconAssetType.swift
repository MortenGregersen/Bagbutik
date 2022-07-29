import Foundation

/**
 # IconAssetType
 String that represents the type of icon contained in the build.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/iconassettype>
 */
public enum IconAssetType: String, Codable, CaseIterable {
    case appStore = "APP_STORE"
    case messagesAppStore = "MESSAGES_APP_STORE"
    case watchAppStore = "WATCH_APP_STORE"
    case tvOSHomeScreen = "TV_OS_HOME_SCREEN"
    case tvOSTopShelf = "TV_OS_TOP_SHELF"
    case alternateExperiment = "ALTERNATE_EXPERIMENT"
}
