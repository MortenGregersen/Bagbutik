import Bagbutik_Models

public extension Request {
    /**
     # Modify the Build for an App Store Version
     Change the build that is attached to a specific App Store version.

     Use this endpoint to associate a build with a version. The build you specify represents the build that’s installed when a customer purchases the app on the App Store.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_build_for_an_app_store_version>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBuildForAppStoreVersionV1(id: String,
                                                requestBody: AppStoreVersionBuildLinkageRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersions/\(id)/relationships/build", method: .patch, requestBody: requestBody)
    }
}
