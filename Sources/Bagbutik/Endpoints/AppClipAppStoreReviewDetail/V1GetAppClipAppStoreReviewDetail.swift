public extension Request {
    /**
      # Read the App Store Review Details of an App Clip
      Get App Store Review details for an App Clip.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_store_review_details_of_an_app_clip>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppClipAppStoreReviewDetailV1(id: String,
                                                 fields: [GetAppClipAppStoreReviewDetailV1.Field]? = nil,
                                                 includes: [GetAppClipAppStoreReviewDetailV1.Include]? = nil) -> Request<AppClipAppStoreReviewDetailResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClipAppStoreReviewDetails/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                     includes: includes))
    }
}

public enum V1GetAppClipAppStoreReviewDetail {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipAppStoreReviewDetails
        case appClipAppStoreReviewDetails([AppClipAppStoreReviewDetails])

        public enum AppClipAppStoreReviewDetails: String, ParameterValue, CaseIterable {
            case appClipDefaultExperience
            case invocationUrls
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appClipDefaultExperience
    }
}
