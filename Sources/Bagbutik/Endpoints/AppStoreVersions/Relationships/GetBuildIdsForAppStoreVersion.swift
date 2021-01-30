public extension Request {
    /**
      # Get the Build ID for an App Store Version
      Get the ID of the build that is attached to a specific App Store version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_the_build_id_for_an_app_store_version>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBuildIdsForAppStoreVersion(id: String) -> Request<AppStoreVersionBuildLinkageResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersions/\(id)/relationships/build", method: .get)
    }
}
