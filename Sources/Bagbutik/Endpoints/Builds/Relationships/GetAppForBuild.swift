public extension Request {
    enum GetAppForBuild {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type apps
            case apps([Apps])

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
    }

    /**
      # Read the App Information of a Build
      Get the app information for a specific build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_information_of_a_build>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppForBuild(id: String,
                               fields: [GetAppForBuild.Field]? = nil) -> Request<AppResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/app", method: .get, parameters: .init(fields: fields))
    }
}
