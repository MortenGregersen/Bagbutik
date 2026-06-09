import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Background Assets Internal Beta Release Information
     Get the state of a background asset version internal beta release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-backgroundAssetVersionInternalBetaReleases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBackgroundAssetVersionInternalBetaReleaseV1(id: String,
                                                               fields: [GetBackgroundAssetVersionInternalBetaReleaseV1.Field]? = nil,
                                                               includes: [GetBackgroundAssetVersionInternalBetaReleaseV1.Include]? = nil) -> Request<BackgroundAssetVersionInternalBetaReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssetVersionInternalBetaReleases/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetBackgroundAssetVersionInternalBetaReleaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type backgroundAssetVersionInternalBetaReleases
        case backgroundAssetVersionInternalBetaReleases([BackgroundAssetVersionInternalBetaReleases])
        /// The fields to include for returned resources of type backgroundAssetVersions
        case backgroundAssetVersions([BackgroundAssetVersions])

        public enum BackgroundAssetVersionInternalBetaReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case backgroundAssetVersion
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BackgroundAssetVersionInternalBetaReleases(rawValue: string) {
                    self = value
                } else if let value = BackgroundAssetVersionInternalBetaReleases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BackgroundAssetVersionInternalBetaReleases value: \(string)"
                    )
                }
            }
        }

        public enum BackgroundAssetVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreRelease
            case assetFile
            case backgroundAsset
            case backgroundAssetUploadFiles
            case createdDate
            case externalBetaRelease
            case internalBetaRelease
            case locale
            case manifestFile
            case platforms
            case state
            case stateDetails
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
        case backgroundAssetVersion
    }
}
