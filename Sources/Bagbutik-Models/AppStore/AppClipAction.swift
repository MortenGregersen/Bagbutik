import Bagbutik_Core
import Foundation

/**
 # AppClipAction
 A string that represents the call-to-action verb on the App Clip card.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipaction>
 */
public enum AppClipAction: String, ParameterValue, Codable, CaseIterable {
    case open = "OPEN"
    case play = "PLAY"
    case view = "VIEW"
}
