import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read information for an uploaded asset pack
     Get details about an uploaded asset pack for Apple hosted background asset.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-backgroundAssetUploadFiles-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBackgroundAssetUploadFileV1(id: String,
                                               fields: [GetBackgroundAssetUploadFileV1.Field]? = nil) -> Request<BackgroundAssetUploadFileResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssetUploadFiles/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBackgroundAssetUploadFileV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type backgroundAssetUploadFiles
        case backgroundAssetUploadFiles([BackgroundAssetUploadFiles])

        public enum BackgroundAssetUploadFiles: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case assetToken
            case assetType
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BackgroundAssetUploadFiles(rawValue: string) {
                    self = value
                } else if let value = BackgroundAssetUploadFiles(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BackgroundAssetUploadFiles value: \(string)"
                    )
                }
            }
        }
    }
}
