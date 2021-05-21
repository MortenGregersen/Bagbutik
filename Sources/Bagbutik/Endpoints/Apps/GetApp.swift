public extension Request {
    enum GetApp {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appInfos
            case appInfos([AppInfos])
            /// The fields to include for returned resources of type appPreOrders
            case appPreOrders([AppPreOrders])
            /// The fields to include for returned resources of type appPrices
            case appPrices([AppPrices])
            /// The fields to include for returned resources of type appStoreVersions
            case appStoreVersions([AppStoreVersions])
            /// The fields to include for returned resources of type apps
            case apps([Apps])
            /// The fields to include for returned resources of type betaAppLocalizations
            case betaAppLocalizations([BetaAppLocalizations])
            /// The fields to include for returned resources of type betaAppReviewDetails
            case betaAppReviewDetails([BetaAppReviewDetails])
            /// The fields to include for returned resources of type betaGroups
            case betaGroups([BetaGroups])
            /// The fields to include for returned resources of type betaLicenseAgreements
            case betaLicenseAgreements([BetaLicenseAgreements])
            /// The fields to include for returned resources of type builds
            case builds([Builds])
            /// The fields to include for returned resources of type endUserLicenseAgreements
            case endUserLicenseAgreements([EndUserLicenseAgreements])
            /// The fields to include for returned resources of type gameCenterEnabledVersions
            case gameCenterEnabledVersions([GameCenterEnabledVersions])
            /// The fields to include for returned resources of type inAppPurchases
            case inAppPurchases([InAppPurchases])
            /// The fields to include for returned resources of type perfPowerMetrics
            case perfPowerMetrics([PerfPowerMetrics])
            /// The fields to include for returned resources of type preReleaseVersions
            case preReleaseVersions([PreReleaseVersions])
            /// The fields to include for returned resources of type territories
            case territories([Territories])

            public enum AppInfos: String, ParameterValue, CaseIterable {
                case ageRatingDeclaration
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

            public enum AppPreOrders: String, ParameterValue, CaseIterable {
                case app
                case appReleaseDate
                case preOrderAvailableDate
            }

            public enum AppPrices: String, ParameterValue, CaseIterable {
                case app
                case priceTier
            }

            public enum AppStoreVersions: String, ParameterValue, CaseIterable {
                case ageRatingDeclaration
                case app
                case appStoreReviewDetail
                case appStoreState
                case appStoreVersionLocalizations
                case appStoreVersionPhasedRelease
                case appStoreVersionSubmission
                case build
                case copyright
                case createdDate
                case downloadable
                case earliestReleaseDate
                case idfaDeclaration
                case platform
                case releaseType
                case routingAppCoverage
                case usesIdfa
                case versionString
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

            public enum BetaAppLocalizations: String, ParameterValue, CaseIterable {
                case app
                case description
                case feedbackEmail
                case locale
                case marketingUrl
                case privacyPolicyUrl
                case tvOsPrivacyPolicy
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

            public enum BetaGroups: String, ParameterValue, CaseIterable {
                case app
                case betaTesters
                case builds
                case createdDate
                case feedbackEnabled
                case isInternalGroup
                case name
                case publicLink
                case publicLinkEnabled
                case publicLinkId
                case publicLinkLimit
                case publicLinkLimitEnabled
            }

            public enum BetaLicenseAgreements: String, ParameterValue, CaseIterable {
                case agreementText
                case app
            }

            public enum Builds: String, ParameterValue, CaseIterable {
                case app
                case appEncryptionDeclaration
                case appStoreVersion
                case betaAppReviewSubmission
                case betaBuildLocalizations
                case betaGroups
                case buildBetaDetail
                case diagnosticSignatures
                case expirationDate
                case expired
                case iconAssetToken
                case icons
                case individualTesters
                case minOsVersion
                case perfPowerMetrics
                case preReleaseVersion
                case processingState
                case uploadedDate
                case usesNonExemptEncryption
                case version
            }

            public enum EndUserLicenseAgreements: String, ParameterValue, CaseIterable {
                case agreementText
                case app
                case territories
            }

            public enum GameCenterEnabledVersions: String, ParameterValue, CaseIterable {
                case app
                case compatibleVersions
                case iconAsset
                case platform
                case versionString
            }

            public enum InAppPurchases: String, ParameterValue, CaseIterable {
                case apps
                case inAppPurchaseType
                case productId
                case referenceName
                case state
            }

            public enum PerfPowerMetrics: String, ParameterValue, CaseIterable {
                case deviceType
                case metricType
                case platform
            }

            public enum PreReleaseVersions: String, ParameterValue, CaseIterable {
                case app
                case builds
                case platform
                case version
            }

            public enum Territories: String, ParameterValue, CaseIterable {
                case currency
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case appInfos, appStoreVersions, availableTerritories, betaAppLocalizations, betaAppReviewDetail, betaGroups, betaLicenseAgreement, builds, endUserLicenseAgreement, gameCenterEnabledVersions, inAppPurchases, preOrder, preReleaseVersions, prices
        }

        /**
         Number of included related resources to return.
         */
        public enum Limit: LimitParameter {
            /// Maximum number of related appInfos returned (when they are included) - maximum 50
            case appInfos(Int)
            /// Maximum number of related appStoreVersions returned (when they are included) - maximum 50
            case appStoreVersions(Int)
            /// Maximum number of related availableTerritories returned (when they are included) - maximum 50
            case availableTerritories(Int)
            /// Maximum number of related betaAppLocalizations returned (when they are included) - maximum 50
            case betaAppLocalizations(Int)
            /// Maximum number of related betaGroups returned (when they are included) - maximum 50
            case betaGroups(Int)
            /// Maximum number of related builds returned (when they are included) - maximum 50
            case builds(Int)
            /// Maximum number of related gameCenterEnabledVersions returned (when they are included) - maximum 50
            case gameCenterEnabledVersions(Int)
            /// Maximum number of related inAppPurchases returned (when they are included) - maximum 50
            case inAppPurchases(Int)
            /// Maximum number of related preReleaseVersions returned (when they are included) - maximum 50
            case preReleaseVersions(Int)
            /// Maximum number of related prices returned (when they are included) - maximum 50
            case prices(Int)
        }
    }

    /**
      # Read App Information
      Get information about a specific app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getApp(id: String,
                       fields: [GetApp.Field]? = nil,
                       includes: [GetApp.Include]? = nil,
                       limits: [GetApp.Limit]? = nil) -> Request<AppResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)", method: .get, parameters: .init(fields: fields,
                                                                             includes: includes,
                                                                             limits: limits))
    }
}
