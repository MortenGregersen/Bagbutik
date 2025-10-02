import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get review submissions for an app
     Get a list of review submissions associated with a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-reviewSubmissions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listReviewSubmissionsForAppV1(id: String,
                                              fields: [ListReviewSubmissionsForAppV1.Field]? = nil,
                                              filters: [ListReviewSubmissionsForAppV1.Filter]? = nil,
                                              includes: [ListReviewSubmissionsForAppV1.Include]? = nil,
                                              limits: [ListReviewSubmissionsForAppV1.Limit]? = nil) -> Request<ReviewSubmissionsResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/reviewSubmissions",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListReviewSubmissionsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type actors
        case actors([Actors])
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type reviewSubmissionItems
        case reviewSubmissionItems([ReviewSubmissionItems])
        /// The fields to include for returned resources of type reviewSubmissions
        case reviewSubmissions([ReviewSubmissions])

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

        public enum AppStoreVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case ageRatingDeclaration
            case alternativeDistributionPackage
            case app
            case appClipDefaultExperience
            case appStoreReviewDetail
            case appStoreState
            case appStoreVersionExperiments
            case appStoreVersionExperimentsV2
            case appStoreVersionLocalizations
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case appVersionState
            case build
            case copyright
            case createdDate
            case customerReviews
            case downloadable
            case earliestReleaseDate
            case gameCenterAppVersion
            case platform
            case releaseType
            case reviewType
            case routingAppCoverage
            case usesIdfa
            case versionString

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreVersions(rawValue: string) {
                    self = value
                } else if let value = AppStoreVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreVersions value: \(string)"
                    )
                }
            }
        }

        public enum Apps: String, Sendable, ParameterValue, Codable, CaseIterable {
            case accessibilityDeclarations
            case accessibilityUrl
            case alternativeDistributionKey
            case analyticsReportRequests
            case appAvailabilityV2
            case appClips
            case appCustomProductPages
            case appEncryptionDeclarations
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
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

        public enum ReviewSubmissionItems: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageVersion
            case appEvent
            case appStoreVersion
            case appStoreVersionExperiment
            case appStoreVersionExperimentV2
            case backgroundAssetVersion
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ReviewSubmissionItems(rawValue: string) {
                    self = value
                } else if let value = ReviewSubmissionItems(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ReviewSubmissionItems value: \(string)"
                    )
                }
            }
        }

        public enum ReviewSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionForReview
            case items
            case lastUpdatedByActor
            case platform
            case state
            case submittedByActor
            case submittedDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = ReviewSubmissions(rawValue: string) {
                    self = value
                } else if let value = ReviewSubmissions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid ReviewSubmissions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'platform'
        case platform([Platform])
        /// Filter by attribute 'state'
        case state([State])

        public enum State: String, Sendable, ParameterValue, Codable, CaseIterable {
            case canceling = "CANCELING"
            case complete = "COMPLETE"
            case completing = "COMPLETING"
            case inReview = "IN_REVIEW"
            case readyForReview = "READY_FOR_REVIEW"
            case unresolvedIssues = "UNRESOLVED_ISSUES"
            case waitingForReview = "WAITING_FOR_REVIEW"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = State(rawValue: string) {
                    self = value
                } else if let value = State(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid State value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case appStoreVersionForReview
        case items
        case lastUpdatedByActor
        case submittedByActor
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related items returned (when they are included) - maximum 50
        case items(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
