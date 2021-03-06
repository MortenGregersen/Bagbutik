public extension Request {
    /**
      # List App Categories
      List all categories on the App Store, including the category and subcategory hierarchy.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_app_categories>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter exists: Attributes, relationships, and IDs to check for existence
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppCategories(fields: [ListAppCategories.Field]? = nil,
                                  filters: [ListAppCategories.Filter]? = nil,
                                  exists: [ListAppCategories.Exist]? = nil,
                                  includes: [ListAppCategories.Include]? = nil,
                                  limits: [ListAppCategories.Limit]? = nil) -> Request<AppCategoriesResponse, ErrorResponse>
    {
        return .init(path: "/v1/appCategories", method: .get, parameters: .init(fields: fields,
                                                                                filters: filters,
                                                                                exists: exists,
                                                                                includes: includes,
                                                                                limits: limits))
    }
}

public enum ListAppCategories {
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'platforms'
        case platforms([Platforms])

        public enum Platforms: String, ParameterValue, CaseIterable {
            case iOS = "IOS"
            case macOS = "MAC_OS"
            case tvOS = "TV_OS"
        }
    }

    /**
     Attributes, relationships, and IDs to check for existence.
     */
    public enum Exist: ExistParameter {
        /// Filter by existence or non-existence of related 'parent'
        case parent(Bool)
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case parent, subcategories
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related subcategories returned (when they are included) - maximum 50
        case subcategories(Int)
    }
}
