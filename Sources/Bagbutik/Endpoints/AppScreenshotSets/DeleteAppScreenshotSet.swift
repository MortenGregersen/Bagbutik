public extension Request {
    /**
      # Delete an App Screenshot Set
      Delete an app screenshot set and all of its screenshots.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_screenshot_set>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppScreenshotSet(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appScreenshotSets/\(id)", method: .delete)
    }
}
