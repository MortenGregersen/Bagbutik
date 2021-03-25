public extension Request {
    enum ListGameCenterEnabledVersionsForApp {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type apps
            case apps([Apps])
            /// The fields to include for returned resources of type gameCenterEnabledVersions
            case gameCenterEnabledVersions([GameCenterEnabledVersions])

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

            public enum GameCenterEnabledVersions: String, ParameterValue, CaseIterable {
                case app
                case compatibleVersions
                case iconAsset
                case platform
                case versionString
            }
        }

        /**
         Attributes, relationships, and IDs by which to filter.
         */
        public enum Filter: FilterParameter {
            /// Filter by id(s)
            case id([String])
            /// Filter by attribute 'platform'
            case platform([Platform])
            /// Filter by attribute 'versionString'
            case versionString([String])

            /// Strings that represent Apple operating systems.
            public enum Platform: String, ParameterValue, CaseIterable {
                /// A string that represents iOS.
                case iOS = "IOS"
                /// A string that represents macOS.
                case macOS = "MAC_OS"
                /// A string that represents tvOS.
                case tvOS = "TV_OS"
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case app, compatibleVersions
        }

        /**
         Attributes by which to sort.
         */
        public enum Sort: String, SortParameter {
            case versionStringAscending = "versionString"
            case versionStringDescending = "-versionString"
        }
    }

    /**
      # List All Game Center Enabled Versions for an App
      Get a list of Game Center enabled versions associated with a specific app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_game_center_enabled_versions_for_an_app>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter sorts: Attributes by which to sort
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listGameCenterEnabledVersionsForApp(id: String,
                                                    fields: [ListGameCenterEnabledVersionsForApp.Field]? = nil,
                                                    filters: [ListGameCenterEnabledVersionsForApp.Filter]? = nil,
                                                    includes: [ListGameCenterEnabledVersionsForApp.Include]? = nil,
                                                    sorts: [ListGameCenterEnabledVersionsForApp.Sort]? = nil,
                                                    limit: Int? = nil) -> Request<GameCenterEnabledVersionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/gameCenterEnabledVersions", method: .get, parameters: .init(fields: fields,
                                                                                                       filters: filters,
                                                                                                       includes: includes,
                                                                                                       sorts: sorts,
                                                                                                       limit: limit))
    }
}
