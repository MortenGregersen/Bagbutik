import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Parent Information of an App Category
     Get the App Store category to which a specific subcategory belongs.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCategories-_id_-parent>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getParentForAppCategoryV1(id: String,
                                          fields: [GetParentForAppCategoryV1.Field]? = nil) -> Request<AppCategoryWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/appCategories/\(id)/parent",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetParentForAppCategoryV1 {
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
}
