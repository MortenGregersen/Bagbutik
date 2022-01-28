public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_reviewsubmissions_id_items>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listItemsForReviewSubmission(id: String,
                                             fields: [ListItemsForReviewSubmission.Field]? = nil,
                                             limit: Int? = nil) -> Request<ReviewSubmissionItemsResponse, ErrorResponse>
    {
        return .init(path: "/v1/reviewSubmissions/\(id)/items", method: .get, parameters: .init(fields: fields,
                                                                                                limit: limit))
    }
}

public enum ListItemsForReviewSubmission {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type reviewSubmissionItems
        case reviewSubmissionItems([ReviewSubmissionItems])

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
    }
}
