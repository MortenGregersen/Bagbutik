public extension Request {
    enum GetAppInfo {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appCategories
            case appCategories([AppCategories])
            /// The fields to include for returned resources of type appInfoLocalizations
            case appInfoLocalizations([AppInfoLocalizations])
            /// The fields to include for returned resources of type appInfos
            case appInfos([AppInfos])

            public enum AppCategories: String, ParameterValue, CaseIterable {
                case parent
                case platforms
                case subcategories
            }

            public enum AppInfoLocalizations: String, ParameterValue, CaseIterable {
                case appInfo
                case locale
                case name
                case privacyPolicyText
                case privacyPolicyUrl
                case subtitle
            }

            public enum AppInfos: String, ParameterValue, CaseIterable {
                case app
                case appInfoLocalizations
                case appStoreAgeRating
                case appStoreState
                case brazilAgeRating
                case kidsAgeBand
                case primaryCategory
                case primarySubcategoryOne
                case primarySubcategoryTwo
                case secondaryCategory
                case secondarySubcategoryOne
                case secondarySubcategoryTwo
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case app, appInfoLocalizations, primaryCategory, primarySubcategoryOne, primarySubcategoryTwo, secondaryCategory, secondarySubcategoryOne, secondarySubcategoryTwo
        }
    }

    /**
      # Read App Info Information
      Read App Store information including your App Store state, age ratings, Brazil age rating, and kids' age band.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_info_information>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppInfo(id: String,
                           fields: [GetAppInfo.Field]? = nil,
                           includes: [GetAppInfo.Include]? = nil,
                           limit: Int? = nil) -> Request<AppInfoResponse, ErrorResponse>
    {
        return .init(path: "/v1/appInfos/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                 includes: includes,
                                                                                 limit: limit))
    }
}
