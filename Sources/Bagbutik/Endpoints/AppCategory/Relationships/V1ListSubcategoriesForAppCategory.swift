public extension Request {
    /**
      # List All Subcategories for an App Category
      List all App Store subcategories that belong to a specific category.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_subcategories_for_an_app_category>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listSubcategoriesForAppCategoryV1(id: String,
                                                  fields: [ListSubcategoriesForAppCategoryV1.Field]? = nil,
                                                  limit: Int? = nil) -> Request<AppCategoriesResponse, ErrorResponse>
    {
        return .init(path: "/v1/appCategories/\(id)/subcategories", method: .get, parameters: .init(fields: fields,
                                                                                                    limit: limit))
    }
}

public enum V1ListSubcategoriesForAppCategory {
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
