import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Info Localization Information
     Read localized app-level information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appInfoLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppInfoLocalizationV1(id: String,
                                         fields: [GetAppInfoLocalizationV1.Field]? = nil,
                                         includes: [GetAppInfoLocalizationV1.Include]? = nil) -> Request<AppInfoLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/appInfoLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                      includes: includes))
    }
}

public enum GetAppInfoLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appInfoLocalizations
        case appInfoLocalizations([AppInfoLocalizations])

        public enum AppInfoLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appInfo
            case locale
            case name
            case privacyChoicesUrl
            case privacyPolicyText
            case privacyPolicyUrl
            case subtitle
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appInfo
    }
}
