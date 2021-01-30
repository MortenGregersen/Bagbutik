public extension Request {
    enum ListAppStoreReviewAttachmentsForAppStoreReviewDetail {
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

    /**
      # List All Review Attachments for an App Store Review Detail
      List all the App Store review attachments you include with a version when you submit it for App Review.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_review_attachments_for_an_app_store_review_detail>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppStoreReviewAttachmentsForAppStoreReviewDetail(id: String,
                                                                     fields: [ListAppStoreReviewAttachmentsForAppStoreReviewDetail.Field]? = nil,
                                                                     includes: [ListAppStoreReviewAttachmentsForAppStoreReviewDetail.Include]? = nil,
                                                                     limit: Int? = nil) -> Request<AppStoreReviewAttachmentsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreReviewDetails/\(id)/appStoreReviewAttachments", method: .get, parameters: .init(fields: fields,
                                                                                                                        includes: includes,
                                                                                                                        limit: limit))
    }
}
