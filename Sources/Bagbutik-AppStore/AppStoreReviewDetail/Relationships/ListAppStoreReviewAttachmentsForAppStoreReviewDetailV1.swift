import Bagbutik_Models

public extension Request {
    /**
     # List All Review Attachments for an App Store Review Detail
     List all the App Store review attachments you include with a version when you submit it for App Review.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_review_attachments_for_an_app_store_review_detail>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppStoreReviewAttachmentsForAppStoreReviewDetailV1(id: String,
                                                                       fields: [ListAppStoreReviewAttachmentsForAppStoreReviewDetailV1.Field]? = nil,
                                                                       includes: [ListAppStoreReviewAttachmentsForAppStoreReviewDetailV1.Include]? = nil,
                                                                       limit: Int? = nil) -> Request<AppStoreReviewAttachmentsResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreReviewDetails/\(id)/appStoreReviewAttachments", method: .get, parameters: .init(fields: fields,
                                                                                                                 includes: includes,
                                                                                                                 limit: limit))
    }
}

public enum ListAppStoreReviewAttachmentsForAppStoreReviewDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreReviewAttachments
        case appStoreReviewAttachments([AppStoreReviewAttachments])
        /// The fields to include for returned resources of type appStoreReviewDetails
        case appStoreReviewDetails([AppStoreReviewDetails])

        public enum AppStoreReviewAttachments: String, ParameterValue, CaseIterable {
            case appStoreReviewDetail
            case assetDeliveryState
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations
            case uploaded
        }

        public enum AppStoreReviewDetails: String, ParameterValue, CaseIterable {
            case appStoreReviewAttachments
            case appStoreVersion
            case contactEmail
            case contactFirstName
            case contactLastName
            case contactPhone
            case demoAccountName
            case demoAccountPassword
            case demoAccountRequired
            case notes
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appStoreReviewDetail
    }
}
