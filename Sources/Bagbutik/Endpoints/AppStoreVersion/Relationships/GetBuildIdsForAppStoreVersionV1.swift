public extension Request {
    /**
     # Get the Build ID for an App Store Version
     Get the ID of the build that is attached to a specific App Store version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_the_build_id_for_an_app_store_version>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildIdsForAppStoreVersionV1(id: String) -> Request<AppStoreVersionBuildLinkageResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersions/\(id)/relationships/build", method: .get)
    }
}
