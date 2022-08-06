import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Primary Subcategory Two Information of an App Info
     Get the second App Store subcategory within an app’s primary category.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_primary_subcategory_two_information_of_an_app_info>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPrimarySubcategoryTwoForAppInfoV1(id: String,
                                                     fields: [GetPrimarySubcategoryTwoForAppInfoV1.Field]? = nil) -> Request<AppCategoryResponse, ErrorResponse>
    {
        .init(path: "/v1/appInfos/\(id)/primarySubcategoryTwo", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetPrimarySubcategoryTwoForAppInfoV1 {
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
