public extension Request {
    /**
      # List All Review Attachments for an App Store Review Detail
      List all the App Store review attachments you include with a version when you submit it for App Review.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_review_attachments_for_an_app_store_review_detail>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppStoreReviewAttachmentsForAppStoreReviewDetail(id: String,
                                                                     fields: [ListAppStoreReviewAttachmentsForAppStoreReviewDetail.Field]? = nil,
                                                                     limit: Int? = nil) -> Request<AppStoreReviewAttachmentsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreReviewDetails/\(id)/appStoreReviewAttachments", method: .get, parameters: .init(fields: fields,
                                                                                                                        limit: limit))
    }
}

public enum ListAppStoreReviewAttachmentsForAppStoreReviewDetail {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreReviewAttachments
        case appStoreReviewAttachments([AppStoreReviewAttachments])

        public enum AppStoreReviewAttachments: String, ParameterValue, CaseIterable {
            case appStoreReviewDetail
            case assetDeliveryState
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations
            case uploaded
        }
    }
}
