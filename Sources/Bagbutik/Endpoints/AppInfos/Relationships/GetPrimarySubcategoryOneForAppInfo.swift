public extension Request {
    enum GetPrimarySubcategoryOneForAppInfo {
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

    /**
      # Read the Primary Subcategory One Information of an App Info
      Get the first App Store subcategory within an app’s primary category.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_primary_subcategory_one_information_of_an_app_info>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getPrimarySubcategoryOneForAppInfo(id: String,
                                                   fields: [GetPrimarySubcategoryOneForAppInfo.Field]? = nil) -> Request<AppCategoryResponse, ErrorResponse>
    {
        return .init(path: "/v1/appInfos/\(id)/primarySubcategoryOne", method: .get, parameters: .init(fields: fields))
    }
}
