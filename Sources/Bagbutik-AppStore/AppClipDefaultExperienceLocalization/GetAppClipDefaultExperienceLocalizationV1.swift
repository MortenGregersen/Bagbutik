import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Localization Information of a Default App Clip Experience
     Get localized metadata that appears on the App Clip card of a specific default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_localization_information_of_a_default_app_clip_experience>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipDefaultExperienceLocalizationV1(id: String,
                                                          fields: [GetAppClipDefaultExperienceLocalizationV1.Field]? = nil,
                                                          includes: [GetAppClipDefaultExperienceLocalizationV1.Include]? = nil) -> Request<AppClipDefaultExperienceLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/appClipDefaultExperienceLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                       includes: includes))
    }
}

public enum GetAppClipDefaultExperienceLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipDefaultExperienceLocalizations
        case appClipDefaultExperienceLocalizations([AppClipDefaultExperienceLocalizations])
        /// The fields to include for returned resources of type appClipHeaderImages
        case appClipHeaderImages([AppClipHeaderImages])

        public enum AppClipDefaultExperienceLocalizations: String, ParameterValue, Codable, CaseIterable {
            case appClipDefaultExperience
            case appClipHeaderImage
            case locale
            case subtitle
        }

        public enum AppClipHeaderImages: String, ParameterValue, Codable, CaseIterable {
            case appClipDefaultExperienceLocalization
            case assetDeliveryState
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case uploadOperations
            case uploaded
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appClipDefaultExperience
        case appClipHeaderImage
    }
}
