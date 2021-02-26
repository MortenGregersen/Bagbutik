public extension Request {
    /**
      # Create an App Store Version
      Add a new App Store version or platform to an app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_store_version>

      - Parameter requestBody: AppStoreVersion representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreVersion(requestBody: AppStoreVersionCreateRequest) -> Request<AppStoreVersionResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersions", method: .post, requestBody: requestBody)
    }
}
