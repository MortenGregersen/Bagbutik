public extension Request {
    /**
      # Modify the Build for an App Store Version
      Change the build that is attached to a specific App Store version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_build_for_an_app_store_version>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: Related linkage
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateBuildForAppStoreVersion(id: String,
                                              requestBody: AppStoreVersionBuildLinkageRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersions/\(id)/relationships/build", method: .patch, requestBody: requestBody)
    }
}
