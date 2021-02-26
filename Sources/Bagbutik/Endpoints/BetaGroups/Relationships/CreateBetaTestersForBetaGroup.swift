public extension Request {
    /**
      # Add Beta Testers to a Beta Group
      Add a specific beta tester to one or more beta groups for beta testing.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/add_beta_testers_to_a_beta_group>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBetaTestersForBetaGroup(id: String,
                                              requestBody: BetaGroupBetaTestersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaGroups/\(id)/relationships/betaTesters", method: .post, requestBody: requestBody)
    }
}
