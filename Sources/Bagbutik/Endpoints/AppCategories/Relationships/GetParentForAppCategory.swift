public extension Request {
    enum GetParentForAppCategory {
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
      # Read the Parent Information of an App Category
      Get the App Store category to which a specific subcategory belongs.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_parent_information_of_an_app_category>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getParentForAppCategory(id: String,
                                        fields: [GetParentForAppCategory.Field]? = nil) -> Request<AppCategoryResponse, ErrorResponse>
    {
        return .init(path: "/v1/appCategories/\(id)/parent", method: .get, parameters: .init(fields: fields))
    }
}
