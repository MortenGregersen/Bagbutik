public extension Request {
    /**
      # Get All App Preview IDs for an App Preview Set
      Get the ordered app preview IDs in a preview set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_all_app_preview_ids_for_an_app_preview_set>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppPreviewIdsForAppPreviewSet(id: String,
                                                  limit: Int? = nil) -> Request<AppPreviewSetAppPreviewsLinkagesResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPreviewSets/\(id)/relationships/appPreviews", method: .get, parameters: .init(limit: limit))
    }
}
