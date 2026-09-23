import BagbutikCore
import BagbutikAppStoreModels
import BagbutikTestFlightModels

public extension Request {
    /**
     # Get the app ID for a prerelease version

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-preReleaseVersions-_id_-relationships-app>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppIdsForPreReleaseVersionV1(id: String) -> Request<PrereleaseVersionAppLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/preReleaseVersions/\(id)/relationships/app",
            method: .get)
    }
}
