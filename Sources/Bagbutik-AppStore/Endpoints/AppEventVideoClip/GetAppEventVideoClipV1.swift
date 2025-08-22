import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appEventVideoClips/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEventVideoClips-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEventVideoClipV1(id: String,
                                       fields: [GetAppEventVideoClipV1.Field]? = nil,
                                       includes: [GetAppEventVideoClipV1.Include]? = nil) -> Request<AppEventVideoClipResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventVideoClips/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetAppEventVideoClipV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEventVideoClips
        case appEventVideoClips([AppEventVideoClips])

        public enum AppEventVideoClips: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appEventAssetType
            case appEventLocalization
            case assetDeliveryState
            case fileName
            case fileSize
            case previewFrameImage
            case previewFrameTimeCode
            case previewImage
            case uploadOperations
            case videoDeliveryState
            case videoUrl

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppEventVideoClips(rawValue: string) {
                    self = value
                } else if let value = AppEventVideoClips(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppEventVideoClips value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appEventLocalization
    }
}
