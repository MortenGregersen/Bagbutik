public extension Request {
    /**
     # List App Encryption Declarations
     Find and list all available app encryption declarations.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_app_encryption_declarations>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppEncryptionDeclarationsV1(fields: [ListAppEncryptionDeclarationsV1.Field]? = nil,
                                                filters: [ListAppEncryptionDeclarationsV1.Filter]? = nil,
                                                includes: [ListAppEncryptionDeclarationsV1.Include]? = nil,
                                                limit: Int? = nil) -> Request<AppEncryptionDeclarationsResponse, ErrorResponse>
    {
        .init(path: "/v1/appEncryptionDeclarations", method: .get, parameters: .init(fields: fields,
                                                                                     filters: filters,
                                                                                     includes: includes,
                                                                                     limit: limit))
    }
}

public enum ListAppEncryptionDeclarationsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEncryptionDeclarations
        case appEncryptionDeclarations([AppEncryptionDeclarations])
        /// The fields to include for returned resources of type apps
        case apps([Apps])

        public enum AppEncryptionDeclarations: String, ParameterValue, CaseIterable {
            case app
            case appEncryptionDeclarationState
            case availableOnFrenchStore
            case builds
            case codeValue
            case containsProprietaryCryptography
            case containsThirdPartyCryptography
            case documentName
            case documentType
            case documentUrl
            case exempt
            case platform
            case uploadedDate
            case usesEncryption
        }

        public enum Apps: String, ParameterValue, CaseIterable {
            case appClips
            case appCustomProductPages
            case appEvents
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
            case ciProduct
            case contentRightsDeclaration
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case name
            case perfPowerMetrics
            case preOrder
            case preReleaseVersions
            case pricePoints
            case prices
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case sku
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'app'
        case app([String])
        /// Filter by id(s) of related 'builds'
        case builds([String])
        /// Filter by attribute 'platform'
        case platform([Platform])

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
        case app
    }
}
