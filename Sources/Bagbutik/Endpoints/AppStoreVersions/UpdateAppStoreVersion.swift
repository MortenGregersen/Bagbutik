public extension Request {
    /**
      # Modify an App Store Version
      Update the app store version for a specific app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_store_version>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppStoreVersion(id: String,
                                      requestBody: AppStoreVersionUpdateRequest) -> Request<AppStoreVersionResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersions/\(id)", method: .patch, requestBody: requestBody)
    }
}
