public extension Request {
    enum ListAppInfosForApp {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appCategories
            case appCategories([AppCategories])
            /// The fields to include for returned resources of type appInfoLocalizations
            case appInfoLocalizations([AppInfoLocalizations])
            /// The fields to include for returned resources of type appInfos
            case appInfos([AppInfos])
            /// The fields to include for returned resources of type apps
            case apps([Apps])

            public enum AppCategories: String, ParameterValue, CaseIterable {
                case parent
                case platforms
                case subcategories
            }

            public enum AppInfoLocalizations: String, ParameterValue, CaseIterable {
                case appInfo
                case locale
                case name
                case privacyPolicyText
                case privacyPolicyUrl
                case subtitle
            }

            public enum AppInfos: String, ParameterValue, CaseIterable {
                case app
                case appInfoLocalizations
                case appStoreAgeRating
                case appStoreState
                case brazilAgeRating
                case kidsAgeBand
                case primaryCategory
                case primarySubcategoryOne
                case primarySubcategoryTwo
                case secondaryCategory
                case secondarySubcategoryOne
                case secondarySubcategoryTwo
            }

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
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case app, appInfoLocalizations, primaryCategory, primarySubcategoryOne, primarySubcategoryTwo, secondaryCategory, secondarySubcategoryOne, secondarySubcategoryTwo
        }
    }

    /**
      # List All App Infos for an App
      Get information about an app that is currently live on App Store, or that goes live with the next version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_infos_for_an_app>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppInfosForApp(id: String,
                                   fields: [ListAppInfosForApp.Field]? = nil,
                                   includes: [ListAppInfosForApp.Include]? = nil,
                                   limit: Int? = nil) -> Request<AppInfosResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/appInfos", method: .get, parameters: .init(fields: fields,
                                                                                      includes: includes,
                                                                                      limit: limit))
    }
}
