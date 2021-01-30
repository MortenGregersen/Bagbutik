public extension Request {
    /**
      # Register a New Bundle ID
      Register a new bundle ID for app development.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_bundle_id>

      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBundleId(requestBody: BundleIdCreateRequest) -> Request<BundleIdResponse, ErrorResponse> {
        return .init(path: "/v1/bundleIds", method: .post, requestBody: requestBody)
    }
}
