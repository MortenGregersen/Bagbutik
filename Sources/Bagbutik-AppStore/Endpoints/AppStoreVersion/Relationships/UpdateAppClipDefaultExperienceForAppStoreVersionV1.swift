import Bagbutik_Core

public extension Request {
    /**
     # Modify the Default App Clip Experience of an App Store Version
     Update the relationship between an App Store version and a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_default_app_clip_experience_of_an_app_store_version>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipDefaultExperienceForAppStoreVersionV1(id: String,
                                                                   requestBody: AppStoreVersionAppClipDefaultExperienceLinkageRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersions/\(id)/relationships/appClipDefaultExperience", method: .patch, requestBody: requestBody)
    }
}
