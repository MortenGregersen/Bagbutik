public extension Request {
    /**
      # Remove Beta Testers from a Beta Group
      Remove a specific beta tester from a one or more beta groups, revoking their access to test builds associated with those groups.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/remove_beta_testers_from_a_beta_group>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteBetaTestersForBetaGroup(id: String,
                                              requestBody: BetaGroupBetaTestersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaGroups/\(id)/relationships/betaTesters", method: .delete, requestBody: requestBody)
    }
}
