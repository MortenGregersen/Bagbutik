public extension Request {
    /**
      # Modify a Capability Configuration
      Update the configuration of a specific capability.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_capability_configuration>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateBundleIdCapability(id: String,
                                         requestBody: BundleIdCapabilityUpdateRequest) -> Request<BundleIdCapabilityResponse, ErrorResponse>
    {
        return .init(path: "/v1/bundleIdCapabilities/\(id)", method: .patch, requestBody: requestBody)
    }
}
