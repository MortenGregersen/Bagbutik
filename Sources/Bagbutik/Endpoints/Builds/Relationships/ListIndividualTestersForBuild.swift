public extension Request {
    /**
      # List All Individual Testers for a Build
      Get a list of beta testers individually assigned to a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_individual_testers_for_a_build>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listIndividualTestersForBuild(id: String,
                                              fields: [ListIndividualTestersForBuild.Field]? = nil,
                                              limit: Int? = nil) -> Request<BetaTestersResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/individualTesters", method: .get, parameters: .init(fields: fields,
                                                                                                 limit: limit))
    }
}

public enum ListIndividualTestersForBuild {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaTesters
        case betaTesters([BetaTesters])

        public enum BetaTesters: String, ParameterValue, CaseIterable {
            case apps
            case betaGroups
            case builds
            case email
            case firstName
            case inviteType
            case lastName
        }
    }
}
