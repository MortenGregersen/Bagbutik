public extension Request {
    /**
      # Add Builds to a Beta Group
      Associate builds with a beta group to enable the group to test the builds.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/add_builds_to_a_beta_group>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBuildsForBetaGroupV1(id: String,
                                           requestBody: BetaGroupBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaGroups/\(id)/relationships/builds", method: .post, requestBody: requestBody)
    }
}
