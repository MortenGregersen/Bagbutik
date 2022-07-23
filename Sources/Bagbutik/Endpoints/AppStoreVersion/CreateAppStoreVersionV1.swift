public extension Request {
    /**
      # Create an App Store Version
      Add a new App Store version or platform to an app.

      Use this endpoint to add a new version of an app. The new version can be an incremental update of an existing app for a particular platform, or it can be the first version on a new platform for the app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_store_version>

      - Parameter requestBody: AppStoreVersion representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreVersionV1(requestBody: AppStoreVersionCreateRequest) -> Request<AppStoreVersionResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersions", method: .post, requestBody: requestBody)
    }
}
