import Bagbutik_Core

public extension Request {
    /**
     # Read the Secondary Subcategory One Information of an App Info
     Get the first App Store subcategory within an app’s secondary category.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_secondary_subcategory_one_information_of_an_app_info>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSecondarySubcategoryOneForAppInfoV1(id: String,
                                                       fields: [GetSecondarySubcategoryOneForAppInfoV1.Field]? = nil) -> Request<AppCategoryResponse, ErrorResponse>
    {
        .init(path: "/v1/appInfos/\(id)/secondarySubcategoryOne", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetSecondarySubcategoryOneForAppInfoV1 {
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
