import Foundation

/// String that indicates how you offer a beta invitation.
public enum BetaInviteType: String, Codable, CaseIterable {
    case email = "EMAIL"
    case publicLink = "PUBLIC_LINK"
}
