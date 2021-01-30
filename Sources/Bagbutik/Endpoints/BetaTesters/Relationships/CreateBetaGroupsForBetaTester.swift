public extension Request {
    /**
      # Add a Beta Tester to Beta Groups
      Add one or more beta testers to a specific beta group.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/add_a_beta_tester_to_beta_groups>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBetaGroupsForBetaTester(id: String,
                                              requestBody: BetaTesterBetaGroupsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaTesters/\(id)/relationships/betaGroups", method: .post, requestBody: requestBody)
    }
}
