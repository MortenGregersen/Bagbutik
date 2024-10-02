import Bagbutik_Core
import Foundation

public enum BetaInviteType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case email = "EMAIL"
    case publicLink = "PUBLIC_LINK"
}
