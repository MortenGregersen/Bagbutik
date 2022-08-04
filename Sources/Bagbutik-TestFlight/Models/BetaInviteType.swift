import Foundation

/**
 # BetaInviteType
 String that indicates how you offer a beta invitation.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betainvitetype>
 */
public enum BetaInviteType: String, Codable, CaseIterable {
    case email = "EMAIL"
    case publicLink = "PUBLIC_LINK"
}
