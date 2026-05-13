import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Nominations
     Get all featuring nominations.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-nominations>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listNominationsV1(fields: [ListNominationsV1.Field]? = nil,
                                  filters: [ListNominationsV1.Filter]? = nil,
                                  includes: [ListNominationsV1.Include]? = nil,
                                  sorts: [ListNominationsV1.Sort]? = nil,
                                  limits: [ListNominationsV1.Limit]? = nil) -> Request<NominationsResponse, ErrorResponse> {
        .init(
            path: "/v1/nominations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListNominationsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type actors
        case actors([Actors])
        /// The fields to include for returned resources of type appEvents
        case appEvents([AppEvents])
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type nominations
        case nominations([Nominations])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum Actors: String, Sendable, ParameterValue, Codable, CaseIterable {
            case actorType
            case apiKeyId
            case userEmail
            case userFirstName
            case userLastName

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Actors(rawValue: string) {
                    self = value
                } else if let value = Actors(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Actors value: \(string)"
                    )
                }
            }
        }

        public enum AppEvents: String, Sendable, ParameterValue, Codable, CaseIterable {
            case archivedTerritorySchedules
            case badge
            case deepLink
            case eventState
            case localizations
            case primaryLocale
            case priority
            case purchaseRequirement
            case purpose
            case referenceName
            case territorySchedules

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppEvents(rawValue: string) {
                    self = value
                } else if let value = AppEvents(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppEvents value: \(string)"
                    )
                }
            }
        }

        public enum Apps: String, Sendable, ParameterValue, Codable, CaseIterable {
            case accessibilityDeclarations
            case accessibilityUrl
            case alternativeDistributionKey
            case analyticsReportRequests
            case androidToIosAppMappingDetails
            case appAvailabilityV2
            case appClips
            case appCustomProductPages
            case appEncryptionDeclarations
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
            case appStoreIcon
            case appStoreVersionExperimentsV2
            case appStoreVersions
            case appTags
            case backgroundAssets
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaFeedbackCrashSubmissions
            case betaFeedbackScreenshotSubmissions
            case betaGroups
            case betaLicenseAgreement
            case betaTesters
            case buildUploads
            case builds
            case bundleId
            case ciProduct
            case contentRightsDeclaration
            case customerReviewSummarizations
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterDetail
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case marketplaceSearchDetail
            case name
            case perfPowerMetrics
            case preReleaseVersions
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case searchKeywords
            case sku
            case streamlinedPurchasingEnabled
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
            case webhooks

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Apps(rawValue: string) {
                    self = value
                } else if let value = Apps(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Apps value: \(string)"
                    )
                }
            }
        }

        public enum Nominations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case createdByActor
            case createdDate
            case description
            case deviceFamilies
            case hasInAppEvents
            case inAppEvents
            case lastModifiedByActor
            case lastModifiedDate
            case launchInSelectMarketsFirst
            case locales
            case name
            case notes
            case preOrderEnabled
            case publishEndDate
            case publishStartDate
            case relatedApps
            case state
            case submittedByActor
            case submittedDate
            case supplementalMaterialsUris
            case supportedTerritories
            case type

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Nominations(rawValue: string) {
                    self = value
                } else if let value = Nominations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Nominations value: \(string)"
                    )
                }
            }
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Territories(rawValue: string) {
                    self = value
                } else if let value = Territories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Territories value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.

     Required: `state`
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'hasInAppEvents'
        case hasInAppEvents([String])
        /// Filter by id(s) of related 'relatedApps'
        case relatedApps([String])
        /// Filter by attribute 'state'
        case state([Nomination.Attributes.State])
        /// Filter by attribute 'type'
        case type([Nomination.Attributes.Type])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case createdByActor
        case inAppEvents
        case lastModifiedByActor
        case relatedApps
        case submittedByActor
        case supportedTerritories
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case lastModifiedDateAscending = "lastModifiedDate"
        case lastModifiedDateDescending = "-lastModifiedDate"
        case nameAscending = "name"
        case nameDescending = "-name"
        case publishEndDateAscending = "publishEndDate"
        case publishEndDateDescending = "-publishEndDate"
        case publishStartDateAscending = "publishStartDate"
        case publishStartDateDescending = "-publishStartDate"
        case typeAscending = "type"
        case typeDescending = "-type"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related inAppEvents returned (when they are included) - maximum 50
        case inAppEvents(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related relatedApps returned (when they are included) - maximum 50
        case relatedApps(Int)
        /// Maximum number of related supportedTerritories returned (when they are included) - maximum 200
        case supportedTerritories(Int)
    }
}
