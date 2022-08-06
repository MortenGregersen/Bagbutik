import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List App Categories
     List all categories on the App Store, including the category and subcategory hierarchy.

     Use this endpoint to retrieve the list of available App Store categories and subcategories. Associate an app with categories using the [Modify an App Info](https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_info) endpoint.
     The first example retrieves the full category and subcategory hierarchy in one request. The second example retrieves just the top-level categories for macOS apps.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_app_categories>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter exists: Attributes, relationships, and IDs to check for existence
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppCategoriesV1(fields: [ListAppCategoriesV1.Field]? = nil,
                                    filters: [ListAppCategoriesV1.Filter]? = nil,
                                    exists: [ListAppCategoriesV1.Exist]? = nil,
                                    includes: [ListAppCategoriesV1.Include]? = nil,
                                    limits: [ListAppCategoriesV1.Limit]? = nil) -> Request<AppCategoriesResponse, ErrorResponse>
    {
        .init(path: "/v1/appCategories", method: .get, parameters: .init(fields: fields,
                                                                         filters: filters,
                                                                         exists: exists,
                                                                         includes: includes,
                                                                         limits: limits))
    }
}

public enum ListAppCategoriesV1 {
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
        case parent
        case subcategories
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
