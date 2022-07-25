import Foundation

/**
   A string that represents the App Store Connect audience for a build.

   Full documentation:
   <https://developer.apple.com/documentation/appstoreconnectapi/buildaudiencetype>
 */
public enum BuildAudienceType: String, Codable, CaseIterable {
    /// The build of your app is only available to members of your development team.
    case internalOnly = "INTERNAL_ONLY"
    /// The build of your app is eligible for submission and release on the App Store.
    case appStoreEligible = "APP_STORE_ELIGIBLE"
}
