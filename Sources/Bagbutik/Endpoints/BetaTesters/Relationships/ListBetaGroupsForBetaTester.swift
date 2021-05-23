public extension Request {
    /**
      # List All Beta Groups to Which a Beta Tester Belongs
      Get a list of beta groups that contain a specific beta tester.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_beta_groups_to_which_a_beta_tester_belongs>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaGroupsForBetaTester(id: String,
                                            fields: [ListBetaGroupsForBetaTester.Field]? = nil,
                                            limit: Int? = nil) -> Request<BetaGroupsResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaTesters/\(id)/betaGroups", method: .get, parameters: .init(fields: fields,
                                                                                               limit: limit))
    }
}

public enum ListBetaGroupsForBetaTester {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaGroups
        case betaGroups([BetaGroups])

        public enum BetaGroups: String, ParameterValue, CaseIterable {
            case app
            case betaTesters
            case builds
            case createdDate
            case feedbackEnabled
            case isInternalGroup
            case name
            case publicLink
            case publicLinkEnabled
            case publicLinkId
            case publicLinkLimit
            case publicLinkLimitEnabled
        }
    }
}
