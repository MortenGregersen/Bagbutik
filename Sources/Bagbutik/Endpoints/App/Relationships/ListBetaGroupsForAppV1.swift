public extension Request {
    /**
      # List All Beta Groups for an App
      Get a list of beta groups associated with a specific app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_beta_groups_for_an_appapps-betaGroups-get_to_many_related>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaGroupsForAppV1(id: String,
                                       fields: [ListBetaGroupsForAppV1.Field]? = nil,
                                       limit: Int? = nil) -> Request<BetaGroupsResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/betaGroups", method: .get, parameters: .init(fields: fields,
                                                                                        limit: limit))
    }
}

public enum ListBetaGroupsForAppV1 {
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
            case hasAccessToAllBuilds
            case iosBuildsAvailableForAppleSiliconMac
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
