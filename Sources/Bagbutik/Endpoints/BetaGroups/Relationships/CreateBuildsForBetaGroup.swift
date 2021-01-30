public extension Request {
    /**
      # Add Builds to a Beta Group
      Associate builds with a beta group to enable the group to test the builds.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/add_builds_to_a_beta_group>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBuildsForBetaGroup(id: String,
                                         requestBody: BetaGroupBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaGroups/\(id)/relationships/builds", method: .post, requestBody: requestBody)
    }
}
