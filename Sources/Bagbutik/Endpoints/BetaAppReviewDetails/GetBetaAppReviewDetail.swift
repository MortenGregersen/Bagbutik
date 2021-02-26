public extension Request {
    enum GetBetaAppReviewDetail {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type apps
            case apps([Apps])
            /// The fields to include for returned resources of type betaAppReviewDetails
            case betaAppReviewDetails([BetaAppReviewDetails])

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

            public enum BetaAppReviewDetails: String, ParameterValue, CaseIterable {
                case app
                case contactEmail
                case contactFirstName
                case contactLastName
                case contactPhone
                case demoAccountName
                case demoAccountPassword
                case demoAccountRequired
                case notes
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case app
        }
    }

    /**
      # Read Beta App Review Detail Information
      Get beta app review details for a specific app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_beta_app_review_detail_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBetaAppReviewDetail(id: String,
                                       fields: [GetBetaAppReviewDetail.Field]? = nil,
                                       includes: [GetBetaAppReviewDetail.Include]? = nil) -> Request<BetaAppReviewDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaAppReviewDetails/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                             includes: includes))
    }
}
