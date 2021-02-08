public extension Request {
    /**
      # Modify a Bundle ID
      Update a specific bundle ID’s name.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_bundle_id>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: BundleId representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateBundleId(id: String,
                               requestBody: BundleIdUpdateRequest) -> Request<BundleIdResponse, ErrorResponse>
    {
        return .init(path: "/v1/bundleIds/\(id)", method: .patch, requestBody: requestBody)
    }
}
