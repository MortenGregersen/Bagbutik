public extension Request {
    enum ListInAppPurchasesForApp {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type apps
            case apps([Apps])
            /// The fields to include for returned resources of type inAppPurchases
            case inAppPurchases([InAppPurchases])

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

            public enum InAppPurchases: String, ParameterValue, CaseIterable {
                case apps
                case inAppPurchaseType
                case productId
                case referenceName
                case state
            }
        }

        /**
         Attributes, relationships, and IDs by which to filter.
         */
        public enum Filter: FilterParameter {
            /// Filter by canBeSubmitted
            case canBeSubmitted([String])
            /// Filter by attribute 'inAppPurchaseType'
            case inAppPurchaseType([InAppPurchaseType])

            public enum InAppPurchaseType: String, ParameterValue, CaseIterable {
                case automaticallyRenewableSubscription = "AUTOMATICALLY_RENEWABLE_SUBSCRIPTION"
                case nonConsumable = "NON_CONSUMABLE"
                case consumable = "CONSUMABLE"
                case nonRenewingSubscription = "NON_RENEWING_SUBSCRIPTION"
                case freeSubscription = "FREE_SUBSCRIPTION"
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case apps
        }

        /**
         Attributes by which to sort.
         */
        public enum Sort: String, SortParameter {
            case inAppPurchaseTypeAscending = "inAppPurchaseType"
            case inAppPurchaseTypeDescending = "-inAppPurchaseType"
            case productIdAscending = "productId"
            case productIdDescending = "-productId"
            case referenceNameAscending = "referenceName"
            case referenceNameDescending = "-referenceName"
        }
    }

    /**
      # List All In-App Purchases for an App
      List the in-app purchases that are available for your app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_in-app_purchases_for_an_app>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter sorts: Attributes by which to sort
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listInAppPurchasesForApp(id: String,
                                         fields: [ListInAppPurchasesForApp.Field]? = nil,
                                         filters: [ListInAppPurchasesForApp.Filter]? = nil,
                                         includes: [ListInAppPurchasesForApp.Include]? = nil,
                                         sorts: [ListInAppPurchasesForApp.Sort]? = nil,
                                         limit: Int? = nil) -> Request<InAppPurchasesResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/inAppPurchases", method: .get, parameters: .init(fields: fields,
                                                                                            filters: filters,
                                                                                            includes: includes,
                                                                                            sorts: sorts,
                                                                                            limit: limit))
    }
}
