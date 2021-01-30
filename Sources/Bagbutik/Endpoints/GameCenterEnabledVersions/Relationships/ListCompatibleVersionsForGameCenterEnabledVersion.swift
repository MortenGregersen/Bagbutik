public extension Request {
    enum ListCompatibleVersionsForGameCenterEnabledVersion {
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
            /// Filter by id(s) of related 'app'
            case app([String])
            /// Filter by id(s)
            case id([String])
            /// Filter by attribute 'platform'
            case platform([Platform])
            /// Filter by attribute 'versionString'
            case versionString([String])

            public enum Platform: String, ParameterValue, CaseIterable {
                case iOS = "IOS"
                case macOS = "MAC_OS"
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
      # List All Compatible Versions for a Game Center Enabled Version
      Get a list of compatible versions associated with a Game Center enabled version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_compatible_versions_for_a_game_center_enabled_version>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter sorts: Attributes by which to sort
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listCompatibleVersionsForGameCenterEnabledVersion(id: String,
                                                                  fields: [ListCompatibleVersionsForGameCenterEnabledVersion.Field]? = nil,
                                                                  filters: [ListCompatibleVersionsForGameCenterEnabledVersion.Filter]? = nil,
                                                                  includes: [ListCompatibleVersionsForGameCenterEnabledVersion.Include]? = nil,
                                                                  sorts: [ListCompatibleVersionsForGameCenterEnabledVersion.Sort]? = nil,
                                                                  limit: Int? = nil) -> Request<GameCenterEnabledVersionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/gameCenterEnabledVersions/\(id)/compatibleVersions", method: .get, parameters: .init(fields: fields,
                                                                                                                     filters: filters,
                                                                                                                     includes: includes,
                                                                                                                     sorts: sorts,
                                                                                                                     limit: limit))
    }
}
