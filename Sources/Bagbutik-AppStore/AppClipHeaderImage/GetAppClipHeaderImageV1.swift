import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the App Clip Card Image
     Get the image that appears on the App Clip card of a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_clip_card_image>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipHeaderImageV1(id: String,
                                        fields: [GetAppClipHeaderImageV1.Field]? = nil,
                                        includes: [GetAppClipHeaderImageV1.Include]? = nil) -> Request<AppClipHeaderImageResponse, ErrorResponse>
    {
        .init(path: "/v1/appClipHeaderImages/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                     includes: includes))
    }
}

public enum GetAppClipHeaderImageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipHeaderImages
        case appClipHeaderImages([AppClipHeaderImages])

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
