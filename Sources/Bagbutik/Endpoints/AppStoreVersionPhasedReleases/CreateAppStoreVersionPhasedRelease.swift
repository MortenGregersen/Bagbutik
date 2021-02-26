public extension Request {
    /**
      # Create an App Store Version Phased Release
      Enable phased release for an App Store version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_store_version_phased_release>

      - Parameter requestBody: AppStoreVersionPhasedRelease representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreVersionPhasedRelease(requestBody: AppStoreVersionPhasedReleaseCreateRequest) -> Request<AppStoreVersionPhasedReleaseResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionPhasedReleases", method: .post, requestBody: requestBody)
    }
}
