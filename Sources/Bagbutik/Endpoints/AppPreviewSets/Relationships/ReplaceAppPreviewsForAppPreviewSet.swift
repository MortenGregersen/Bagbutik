public extension Request {
    /**
      # Replace All App Previews for an App Preview Set
      Change the order of the app previews in a preview set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/replace_all_app_previews_for_an_app_preview_set>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func replaceAppPreviewsForAppPreviewSet(id: String,
                                                   requestBody: AppPreviewSetAppPreviewsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPreviewSets/\(id)/relationships/appPreviews", method: .patch, requestBody: requestBody)
    }
}
