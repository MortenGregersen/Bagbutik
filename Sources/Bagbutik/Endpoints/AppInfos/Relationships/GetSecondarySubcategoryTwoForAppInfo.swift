public extension Request {
    /**
      # Read the Secondary Subcategory Two Information of an App Info
      Get the second App Store subcategory within an app’s secondary category.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_secondary_subcategory_two_information_of_an_app_info>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSecondarySubcategoryTwoForAppInfo(id: String,
                                                     fields: [GetSecondarySubcategoryTwoForAppInfo.Field]? = nil) -> Request<AppCategoryResponse, ErrorResponse>
    {
        return .init(path: "/v1/appInfos/\(id)/secondarySubcategoryTwo", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetSecondarySubcategoryTwoForAppInfo {
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
