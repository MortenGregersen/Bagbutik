import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Image Information for an Advanced App Clip Experience
     Get information about the image that appears on the App Clip card of an advanced App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appClipAdvancedExperienceImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipAdvancedExperienceImageV1(id: String,
                                                    fields: [GetAppClipAdvancedExperienceImageV1.Field]? = nil) -> Request<AppClipAdvancedExperienceImageResponse, ErrorResponse>
    {
        .init(path: "/v1/appClipAdvancedExperienceImages/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAppClipAdvancedExperienceImageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipAdvancedExperienceImages
        case appClipAdvancedExperienceImages([AppClipAdvancedExperienceImages])

        public enum AppClipAdvancedExperienceImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case uploadOperations
        }
    }
}
