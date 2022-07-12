public extension Request {
    /**
      # Replace All App Previews for an App Preview Set
      Change the order of the app previews in a preview set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/replace_all_app_previews_for_an_app_preview_set>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func replaceAppPreviewsForAppPreviewSetV1(id: String,
                                                     requestBody: AppPreviewSetAppPreviewsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPreviewSets/\(id)/relationships/appPreviews", method: .patch, requestBody: requestBody)
    }
}
