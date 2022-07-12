public extension Request {
    /**
      # Read the Secondary Category Information of an App Info
      Get an app’s secondary App Store category.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_secondary_category_information_of_an_app_info>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSecondaryCategoryForAppInfoV1(id: String,
                                                 fields: [GetSecondaryCategoryForAppInfoV1.Field]? = nil) -> Request<AppCategoryResponse, ErrorResponse>
    {
        return .init(path: "/v1/appInfos/\(id)/secondaryCategory", method: .get, parameters: .init(fields: fields))
    }
}

public enum V1GetSecondaryCategoryForAppInfo {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCategories
        case appCategories([AppCategories])

        public enum AppCategories: String, ParameterValue, CaseIterable {
            case parent
            case platforms
            case subcategories
        }
    }
}
