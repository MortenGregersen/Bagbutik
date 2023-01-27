import Bagbutik_Core
import Foundation

/**
 # AppClipAction
 A string that represents the call-to-action verb on the App Clip card.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipaction>
 */
public enum AppClipAction: String, ParameterValue, CaseIterable {
    case open = "OPEN"
    case view = "VIEW"
    case play = "PLAY"
}
