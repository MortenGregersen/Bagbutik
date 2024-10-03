import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the Default App Clip Experiences Resource ID for an App Store Version
     Get the ID of an app’s related default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-relationships-appClipDefaultExperience>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipDefaultExperienceIdsForAppStoreVersionV1(id: String) -> Request<AppStoreVersionAppClipDefaultExperienceLinkageResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersions/\(id)/relationships/appClipDefaultExperience", method: .get)
    }
}
