public extension Request {
    /**
      # Read App Category Information
      Get a specific app category.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_category_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related subcategories returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppCategory(id: String,
                               fields: [GetAppCategory.Field]? = nil,
                               includes: [GetAppCategory.Include]? = nil,
                               limit: Int? = nil) -> Request<AppCategoryResponse, ErrorResponse>
    {
        return .init(path: "/v1/appCategories/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                      includes: includes,
                                                                                      limit: limit))
    }
}

public enum GetAppCategory {
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

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case parent, subcategories
    }
}
