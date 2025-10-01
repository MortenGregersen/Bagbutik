import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read background asset upload file information for a background asset version
     Get details about a background asset upload file for a specific background asset version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-backgroundAssetVersions-_id_-backgroundAssetUploadFiles>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBackgroundAssetUploadFilesForBackgroundAssetVersionV1(id: String,
                                                                          fields: [ListBackgroundAssetUploadFilesForBackgroundAssetVersionV1.Field]? = nil,
                                                                          limit: Int? = nil) -> Request<BackgroundAssetUploadFilesResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssetVersions/\(id)/backgroundAssetUploadFiles",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListBackgroundAssetUploadFilesForBackgroundAssetVersionV1 {
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
            case sourceFileChecksums
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
