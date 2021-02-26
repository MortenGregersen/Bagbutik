public extension Request {
    /**
      # Delete a Bundle ID
      Delete a bundle ID that is used for app development.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_bundle_id>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteBundleId(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/bundleIds/\(id)", method: .delete)
    }
}
