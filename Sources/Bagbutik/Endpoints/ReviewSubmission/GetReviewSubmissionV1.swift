public extension Request {
    /**
      # GET /v1/reviewSubmissions/{id}

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_reviewsubmissions_id>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related items returned (when they are included) - maximum 50
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getReviewSubmissionV1(id: String,
                                      fields: [GetReviewSubmissionV1.Field]? = nil,
                                      includes: [GetReviewSubmissionV1.Include]? = nil,
                                      limit: Int? = nil) -> Request<ReviewSubmissionResponse, ErrorResponse>
    {
        return .init(path: "/v1/reviewSubmissions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                          includes: includes,
                                                                                          limit: limit))
    }
}

public enum GetReviewSubmissionV1 {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app, appStoreVersionForReview, items
    }
}
