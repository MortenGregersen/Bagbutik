public extension Request {
    /**
      # Remove Builds from a Beta Group
      Remove access to test one or more builds from beta testers in a specific beta group.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/remove_builds_from_a_beta_group>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: List of related linkages
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBuildsForBetaGroupV1(id: String,
                                           requestBody: BetaGroupBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaGroups/\(id)/relationships/builds", method: .delete, requestBody: requestBody)
    }
}
