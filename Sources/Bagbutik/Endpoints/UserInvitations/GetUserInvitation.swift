public extension Request {
    enum GetUserInvitation {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type apps
            case apps([Apps])
            /// The fields to include for returned resources of type userInvitations
            case userInvitations([UserInvitations])

            public enum Apps: String, ParameterValue, CaseIterable {
                case appInfos
                case appStoreVersions
                case availableInNewTerritories
                case availableTerritories
                case betaAppLocalizations
                case betaAppReviewDetail
                case betaGroups
                case betaLicenseAgreement
                case betaTesters
                case builds
                case bundleId
                case contentRightsDeclaration
                case endUserLicenseAgreement
                case gameCenterEnabledVersions
                case inAppPurchases
                case isOrEverWasMadeForKids
                case name
                case perfPowerMetrics
                case preOrder
                case preReleaseVersions
                case prices
                case primaryLocale
                case sku
            }

            public enum UserInvitations: String, ParameterValue, CaseIterable {
                case allAppsVisible
                case email
                case expirationDate
                case firstName
                case lastName
                case provisioningAllowed
                case roles
                case visibleApps
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case visibleApps
        }
    }

    /**
      # Read User Invitation Information
      Get information about a pending invitation to join your team.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_user_invitation_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related visibleApps returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getUserInvitation(id: String,
                                  fields: [GetUserInvitation.Field]? = nil,
                                  includes: [GetUserInvitation.Include]? = nil,
                                  limit: Int? = nil) -> Request<UserInvitationResponse, ErrorResponse>
    {
        return .init(path: "/v1/userInvitations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes,
                                                                                        limit: limit))
    }
}
