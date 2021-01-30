public extension Request {
    /**
      # Delete an App Preview Set
      Delete an app preview set and all of its previews.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_preview_set>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppPreviewSet(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appPreviewSets/\(id)", method: .delete)
    }
}
