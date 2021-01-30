public extension Request {
    /**
      # Delete an App Preview
      Delete an app preview within a preview set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_preview>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppPreview(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appPreviews/\(id)", method: .delete)
    }
}
