public extension Request {
    /**
      # Get All Build IDs in a Beta Group
      Get a list of build resource IDs in a specific beta group.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_all_build_ids_in_a_beta_group>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBuildIdsForBetaGroup(id: String,
                                         limit: Int? = nil) -> Request<BetaGroupBuildsLinkagesResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaGroups/\(id)/relationships/builds", method: .get, parameters: .init(limit: limit))
    }
}
