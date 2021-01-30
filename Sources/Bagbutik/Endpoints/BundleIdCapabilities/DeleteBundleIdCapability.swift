public extension Request {
    /**
      # Disable a Capability
      Disable a capability for a bundle ID.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/disable_a_capability>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteBundleIdCapability(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/bundleIdCapabilities/\(id)", method: .delete)
    }
}
