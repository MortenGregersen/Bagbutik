import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read build upload file information
     Get details about a specific build upload file for a build upload.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildUploadFiles-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildUploadFileV1(id: String,
                                     fields: [GetBuildUploadFileV1.Field]? = nil) -> Request<BuildUploadFileResponse, ErrorResponse> {
        .init(
            path: "/v1/buildUploadFiles/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBuildUploadFileV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type buildUploadFiles
        case buildUploadFiles([BuildUploadFiles])

        public enum BuildUploadFiles: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case assetToken
            case assetType
            case fileName
            case fileSize
            case sourceFileChecksums
            case uploadOperations
            case uti

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BuildUploadFiles(rawValue: string) {
                    self = value
                } else if let value = BuildUploadFiles(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BuildUploadFiles value: \(string)"
                    )
                }
            }
        }
    }
}
