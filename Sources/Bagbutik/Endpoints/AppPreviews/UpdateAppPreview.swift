public extension Request {
    /**
      # Modify an App Preview
      Commit the app preview after uploading it, and update the poster frame timecode.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_preview>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppPreview representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppPreview(id: String,
                                 requestBody: AppPreviewUpdateRequest) -> Request<AppPreviewResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPreviews/\(id)", method: .patch, requestBody: requestBody)
    }
}
