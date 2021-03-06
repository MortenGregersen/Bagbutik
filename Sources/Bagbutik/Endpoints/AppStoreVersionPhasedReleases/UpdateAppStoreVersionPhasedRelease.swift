public extension Request {
    /**
      # Modify an App Store Version Phased Release
      Pause or resume a phased release, or immediately release an app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_store_version_phased_release>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppStoreVersionPhasedRelease representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppStoreVersionPhasedRelease(id: String,
                                                   requestBody: AppStoreVersionPhasedReleaseUpdateRequest) -> Request<AppStoreVersionPhasedReleaseResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersionPhasedReleases/\(id)", method: .patch, requestBody: requestBody)
    }
}
