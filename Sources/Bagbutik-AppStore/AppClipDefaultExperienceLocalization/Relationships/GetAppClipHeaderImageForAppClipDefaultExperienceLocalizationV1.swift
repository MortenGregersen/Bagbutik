import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Clip Card Image Information for a Localized Default App Clip Experience
     Get the image that appears on the App Clip card, specific to a locale, for a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_app_clip_card_image_information_for_a_localized_default_app_clip_experience>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipHeaderImageForAppClipDefaultExperienceLocalizationV1(id: String,
                                                                               fields: [GetAppClipHeaderImageForAppClipDefaultExperienceLocalizationV1.Field]? = nil,
                                                                               includes: [GetAppClipHeaderImageForAppClipDefaultExperienceLocalizationV1.Include]? = nil) -> Request<AppClipHeaderImageResponse, ErrorResponse>
    {
        .init(path: "/v1/appClipDefaultExperienceLocalizations/\(id)/appClipHeaderImage", method: .get, parameters: .init(fields: fields,
                                                                                                                          includes: includes))
    }
}

public enum GetAppClipHeaderImageForAppClipDefaultExperienceLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipDefaultExperienceLocalizations
        case appClipDefaultExperienceLocalizations([AppClipDefaultExperienceLocalizations])
        /// The fields to include for returned resources of type appClipHeaderImages
        case appClipHeaderImages([AppClipHeaderImages])

        public enum AppClipDefaultExperienceLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appClipDefaultExperience
            case appClipHeaderImage
            case locale
            case subtitle
        }

        public enum AppClipHeaderImages: String, Sendable, ParameterValue, Codable, CaseIterable {
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
    public enum Include: String, IncludeParameter, CaseIterable {
        case appClipDefaultExperienceLocalization
    }
}
