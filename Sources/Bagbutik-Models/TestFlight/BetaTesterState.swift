import Bagbutik_Core
import Foundation

/**
 # BetaTesterState
 String that describes the state of a beta tester.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatesterstate>
 */
public enum BetaTesterState: String, Codable, CaseIterable {
    /// The beta tester has accepted an invite to test a build.
    case accepted = "ACCEPTED"
    /// The beta tester has installed a build.
    case installed = "INSTALLED"
    /// The beta tester was invited to test a build.
    case invited = "INVITED"
    /// The beta tester is not currently invited.
    case notInvited = "NOT_INVITED"
    /// The beta tester chose to stop testing or the beta tester was removed from the app. In both cases the build they installed is not expired. Once the build expires, the system deletes the resource.
    case revoked = "REVOKED"
}
