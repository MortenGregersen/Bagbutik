public extension Request {
    enum GetAppStoreReviewAttachment {
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

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case appStoreReviewDetail
        }
    }

    /**
      # Read App Store Review Attachment Information
      Get information about an App Store review attachment and its upload and processing status.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_store_review_attachment_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppStoreReviewAttachment(id: String,
                                            fields: [GetAppStoreReviewAttachment.Field]? = nil,
                                            includes: [GetAppStoreReviewAttachment.Include]? = nil) -> Request<AppStoreReviewAttachmentResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreReviewAttachments/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                  includes: includes))
    }
}
