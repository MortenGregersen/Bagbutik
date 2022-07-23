public extension Request {
    /**
      # Read the Primary Category Information of an App Info
      Get an app’s primary App Store category.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_primary_category_information_of_an_app_info>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPrimaryCategoryForAppInfoV1(id: String,
                                               fields: [GetPrimaryCategoryForAppInfoV1.Field]? = nil) -> Request<AppCategoryResponse, ErrorResponse>
    {
        return .init(path: "/v1/appInfos/\(id)/primaryCategory", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetPrimaryCategoryForAppInfoV1 {
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
