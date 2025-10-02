import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read background assets information
     Get details about a specific background asset version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-backgroundAssetVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBackgroundAssetVersionV1(id: String,
                                            fields: [GetBackgroundAssetVersionV1.Field]? = nil,
                                            includes: [GetBackgroundAssetVersionV1.Include]? = nil) -> Request<BackgroundAssetVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssetVersions/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetBackgroundAssetVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type backgroundAssetVersions
        case backgroundAssetVersions([BackgroundAssetVersions])

        public enum BackgroundAssetVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreRelease
            case assetFile
            case backgroundAsset
            case backgroundAssetUploadFiles
            case createdDate
            case externalBetaRelease
            case internalBetaRelease
            case manifestFile
            case platforms
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BackgroundAssetVersions(rawValue: string) {
                    self = value
                } else if let value = BackgroundAssetVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BackgroundAssetVersions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appStoreRelease
        case assetFile
        case backgroundAsset
        case externalBetaRelease
        case internalBetaRelease
        case manifestFile
    }
}
