public extension Request {
    /**
      # Create a Beta Group
      Create a beta group associated with an app, optionally enabling TestFlight public links.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_a_beta_group>

      - Parameter requestBody: BetaGroup representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBetaGroup(requestBody: BetaGroupCreateRequest) -> Request<BetaGroupResponse, ErrorResponse> {
        return .init(path: "/v1/betaGroups", method: .post, requestBody: requestBody)
    }
}
