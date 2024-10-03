import Bagbutik_Core
import Foundation

public enum AppClipAction: String, Sendable, ParameterValue, Codable, CaseIterable {
    case open = "OPEN"
    case play = "PLAY"
    case view = "VIEW"
}
