import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List review submissions for an app
     List recent and current review submissions for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-reviewSubmissions>

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

        public enum ReviewSubmissionItems: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageVersion
            case appEvent
            case appStoreVersion
            case appStoreVersionExperiment
            case appStoreVersionExperimentV2
            case removed
            case resolved
            case reviewSubmission
            case state
        }

        public enum ReviewSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionForReview
            case canceled
            case items
            case lastUpdatedByActor
            case platform
            case state
            case submitted
            case submittedByActor
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
