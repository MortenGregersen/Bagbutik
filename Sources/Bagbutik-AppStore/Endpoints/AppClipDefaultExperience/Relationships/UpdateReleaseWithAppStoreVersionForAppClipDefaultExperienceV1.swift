import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the Related App Store Version for a Default App Clip Experience
     Update the relationship between a default App Clip experience and an App Store Version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appClipDefaultExperiences-_id_-relationships-releaseWithAppStoreVersion>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateReleaseWithAppStoreVersionForAppClipDefaultExperienceV1(id: String,
                                                                              requestBody: AppClipDefaultExperienceReleaseWithAppStoreVersionLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipDefaultExperiences/\(id)/relationships/releaseWithAppStoreVersion",
            method: .patch,
            requestBody: requestBody)
    }
}
