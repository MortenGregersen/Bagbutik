import Bagbutik_Core
import Foundation

public enum BetaTesterState: String, Sendable, Codable, CaseIterable {
    case accepted = "ACCEPTED"
    case installed = "INSTALLED"
    case invited = "INVITED"
    case notInvited = "NOT_INVITED"
    case revoked = "REVOKED"
}
