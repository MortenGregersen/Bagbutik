import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Category Information
     Get a specific app category.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCategories-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related subcategories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppCategoryV1(id: String,
                                 fields: [GetAppCategoryV1.Field]? = nil,
                                 includes: [GetAppCategoryV1.Include]? = nil,
                                 limit: GetAppCategoryV1.Limit? = nil) -> Request<AppCategoryResponse, ErrorResponse> {
        .init(
            path: "/v1/appCategories/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetAppCategoryV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCategories
        case appCategories([AppCategories])

        public enum AppCategories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case parent
            case platforms
            case subcategories
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case parent
        case subcategories
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related subcategories returned (when they are included) - maximum 50
        case subcategories(Int)
    }
}
