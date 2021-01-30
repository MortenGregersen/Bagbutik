public extension Request {
    enum GetBundleId {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type apps
            case apps([Apps])
            /// The fields to include for returned resources of type bundleIdCapabilities
            case bundleIdCapabilities([BundleIdCapabilities])
            /// The fields to include for returned resources of type bundleIds
            case bundleIds([BundleIds])
            /// The fields to include for returned resources of type profiles
            case profiles([Profiles])

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

            public enum BundleIdCapabilities: String, ParameterValue, CaseIterable {
                case bundleId
                case capabilityType
                case settings
            }

            public enum BundleIds: String, ParameterValue, CaseIterable {
                case app
                case bundleIdCapabilities
                case identifier
                case name
                case platform
                case profiles
                case seedId
            }

            public enum Profiles: String, ParameterValue, CaseIterable {
                case bundleId
                case certificates
                case createdDate
                case devices
                case expirationDate
                case name
                case platform
                case profileContent
                case profileState
                case profileType
                case uuid
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case app, bundleIdCapabilities, profiles
        }

        /**
         Number of included related resources to return.
         */
        public enum Limit: LimitParameter {
            /// Maximum number of related bundleIdCapabilities returned (when they are included) - maximum 50
            case bundleIdCapabilities(Int)
            /// Maximum number of related profiles returned (when they are included) - maximum 50
            case profiles(Int)
        }
    }

    /**
      # Read Bundle ID Information
      Get information about a specific bundle ID.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_bundle_id_information>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getBundleId(id: String,
                            fields: [GetBundleId.Field]? = nil,
                            includes: [GetBundleId.Include]? = nil,
                            limits: [GetBundleId.Limit]? = nil) -> Request<BundleIdResponse, ErrorResponse>
    {
        return .init(path: "/v1/bundleIds/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                  includes: includes,
                                                                                  limits: limits))
    }
}
