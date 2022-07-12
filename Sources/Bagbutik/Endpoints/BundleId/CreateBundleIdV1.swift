public extension Request {
    /**
      # Register a New Bundle ID
      Register a new bundle ID for app development.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_bundle_id>

      - Parameter requestBody: BundleId representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBundleIdV1(requestBody: BundleIdCreateRequest) -> Request<BundleIdResponse, ErrorResponse> {
        return .init(path: "/v1/bundleIds", method: .post, requestBody: requestBody)
    }
}
