public extension Request {
    enum GetAppInfoLocalization {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appInfoLocalizations
            case appInfoLocalizations([AppInfoLocalizations])

            public enum AppInfoLocalizations: String, ParameterValue, CaseIterable {
                case appInfo
                case locale
                case name
                case privacyPolicyText
                case privacyPolicyUrl
                case subtitle
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case appInfo
        }
    }

    /**
      # Read App Info Localization Information
      Read localized app-level information.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_info_localization_information>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppInfoLocalization(id: String,
                                       fields: [GetAppInfoLocalization.Field]? = nil,
                                       includes: [GetAppInfoLocalization.Include]? = nil) -> Request<AppInfoLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appInfoLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                             includes: includes))
    }
}
