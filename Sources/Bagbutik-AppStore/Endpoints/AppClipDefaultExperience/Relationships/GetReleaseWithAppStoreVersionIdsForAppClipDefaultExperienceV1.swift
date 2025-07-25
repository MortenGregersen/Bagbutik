import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the App Store Versions Resource ID for a Default App Clip Experience
     Get IDs for App Store Versions related to a default App Clip experience.

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
