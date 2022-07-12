public extension Request {
    /**
      # Enable a Capability
      Enable a capability for a bundle ID.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/enable_a_capability>

      - Parameter requestBody: BundleIdCapability representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBundleIdCapabilityV1(requestBody: BundleIdCapabilityCreateRequest) -> Request<BundleIdCapabilityResponse, ErrorResponse> {
        return .init(path: "/v1/bundleIdCapabilities", method: .post, requestBody: requestBody)
    }
}
