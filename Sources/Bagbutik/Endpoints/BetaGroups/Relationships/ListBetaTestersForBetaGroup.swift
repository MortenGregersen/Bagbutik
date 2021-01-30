public extension Request {
    enum ListBetaTestersForBetaGroup {
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

    /**
      # List All Beta Testers in a BetaGroup
      Get a list of beta testers contained in a specific beta group.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_beta_testers_in_a_betagroup>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaTestersForBetaGroup(id: String,
                                            fields: [ListBetaTestersForBetaGroup.Field]? = nil,
                                            limit: Int? = nil) -> Request<BetaTestersResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaGroups/\(id)/betaTesters", method: .get, parameters: .init(fields: fields,
                                                                                               limit: limit))
    }
}
