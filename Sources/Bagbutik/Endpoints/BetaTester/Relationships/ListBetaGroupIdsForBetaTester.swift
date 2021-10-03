public extension Request {
    /**
      # Get All Beta Group IDs of a Beta Tester's Groups
      Get a list of group resource IDs associated with a beta tester.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_all_beta_group_ids_of_a_beta_tester_s_groups>

      - Parameter id: The id of the requested resource
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaGroupIdsForBetaTester(id: String,
                                              limit: Int? = nil) -> Request<BetaTesterBetaGroupsLinkagesResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaTesters/\(id)/relationships/betaGroups", method: .get, parameters: .init(limit: limit))
    }
}
