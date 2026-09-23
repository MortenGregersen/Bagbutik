import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Get the app store versions resource id for a default app clip experience

     Get IDs for App Store Versions related to a default App Clip experience.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appClipDefaultExperiences-_id_-relationships-releaseWithAppStoreVersion>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getReleaseWithAppStoreVersionIdsForAppClipDefaultExperienceV1(id: String) -> Request<AppClipDefaultExperienceReleaseWithAppStoreVersionLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipDefaultExperiences/\(id)/relationships/releaseWithAppStoreVersion",
            method: .get)
    }
}
