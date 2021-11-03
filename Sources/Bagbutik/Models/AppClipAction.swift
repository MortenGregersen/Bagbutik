import Foundation

/// A string that represents the call-to-action verb on the App Clip card.
public enum AppClipAction: String, Codable, CaseIterable {
    case open = "OPEN"
    case view = "VIEW"
    case play = "PLAY"
}
