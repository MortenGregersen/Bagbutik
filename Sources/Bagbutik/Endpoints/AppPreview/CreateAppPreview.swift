public extension Request {
    /**
      # Create an App Preview
      Add a new app preview to a preview set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_preview>

      - Parameter requestBody: AppPreview representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppPreview(requestBody: AppPreviewCreateRequest) -> Request<AppPreviewResponse, ErrorResponse> {
        return .init(path: "/v1/appPreviews", method: .post, requestBody: requestBody)
    }
}
