import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/apps/{id}/reviewSubmissions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_apps_id_reviewSubmissions>

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
                                              limits: [ListReviewSubmissionsForAppV1.Limit]? = nil) -> Request<ReviewSubmissionsResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/reviewSubmissions", method: .get, parameters: .init(fields: fields,
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
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type reviewSubmissionItems
        case reviewSubmissionItems([ReviewSubmissionItems])
        /// The fields to include for returned resources of type reviewSubmissions
        case reviewSubmissions([ReviewSubmissions])

        public enum AppStoreVersions: String, ParameterValue, CaseIterable {
            case ageRatingDeclaration
            case app
            case appClipDefaultExperience
            case appStoreReviewDetail
            case appStoreState
            case appStoreVersionExperiments
            case appStoreVersionLocalizations
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case build
            case copyright
            case createdDate
            case customerReviews
            case downloadable
            case earliestReleaseDate
            case platform
            case releaseType
            case routingAppCoverage
            case versionString
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

        public enum ReviewSubmissionItems: String, ParameterValue, CaseIterable {
            case appCustomProductPageVersion
            case appEvent
            case appStoreVersion
            case appStoreVersionExperiment
            case removed
            case resolved
            case reviewSubmission
            case state
        }

        public enum ReviewSubmissions: String, ParameterValue, CaseIterable {
            case app
            case appStoreVersionForReview
            case canceled
            case items
            case platform
            case state
            case submitted
            case submittedDate
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

        public enum Platform: String, ParameterValue, CaseIterable {
            case iOS = "IOS"
            case macOS = "MAC_OS"
            case tvOS = "TV_OS"
        }

        public enum State: String, ParameterValue, CaseIterable {
            case readyForReview = "READY_FOR_REVIEW"
            case waitingForReview = "WAITING_FOR_REVIEW"
            case inReview = "IN_REVIEW"
            case unresolvedIssues = "UNRESOLVED_ISSUES"
            case canceling = "CANCELING"
            case completing = "COMPLETING"
            case complete = "COMPLETE"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app
        case appStoreVersionForReview
        case items
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
