public extension Request {
    /**
      # Create an App Preview Set
      Add a new app preview set to an App Store version localization for a specific app preview type and display size.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_preview_set>

      - Parameter requestBody: AppPreviewSet representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppPreviewSetV1(requestBody: AppPreviewSetCreateRequest) -> Request<AppPreviewSetResponse, ErrorResponse> {
        return .init(path: "/v1/appPreviewSets", method: .post, requestBody: requestBody)
    }
}
