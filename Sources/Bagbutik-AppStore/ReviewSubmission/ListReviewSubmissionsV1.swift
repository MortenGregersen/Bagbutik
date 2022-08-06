import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/reviewSubmissions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_reviewsubmissions>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listReviewSubmissionsV1(fields: [ListReviewSubmissionsV1.Field]? = nil,
                                        filters: [ListReviewSubmissionsV1.Filter]? = nil,
                                        includes: [ListReviewSubmissionsV1.Include]? = nil,
                                        limits: [ListReviewSubmissionsV1.Limit]? = nil) -> Request<ReviewSubmissionsResponse, ErrorResponse>
    {
        .init(path: "/v1/reviewSubmissions", method: .get, parameters: .init(fields: fields,
                                                                             filters: filters,
                                                                             includes: includes,
                                                                             limits: limits))
    }
}

public enum ListReviewSubmissionsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type reviewSubmissionItems
        case reviewSubmissionItems([ReviewSubmissionItems])
        /// The fields to include for returned resources of type reviewSubmissions
        case reviewSubmissions([ReviewSubmissions])

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

     Required: `app`
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'app'
        case app([String])
        /// Filter by attribute 'platform'
        case platform([Platform])
        /// Filter by attribute 'state'
        case state([ReviewSubmission.Attributes.State])

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
