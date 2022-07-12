public extension Request {
    /**
      # Add a Beta Tester to Beta Groups
      Add one or more beta testers to a specific beta group.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/add_a_beta_tester_to_beta_groups>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBetaGroupsForBetaTesterV1(id: String,
                                                requestBody: BetaTesterBetaGroupsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaTesters/\(id)/relationships/betaGroups", method: .post, requestBody: requestBody)
    }
}
