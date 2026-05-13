import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Background Assets Information
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
        /// The fields to include for returned resources of type backgroundAssetUploadFiles
        case backgroundAssetUploadFiles([BackgroundAssetUploadFiles])
        /// The fields to include for returned resources of type backgroundAssetVersionAppStoreReleases
        case backgroundAssetVersionAppStoreReleases([BackgroundAssetVersionAppStoreReleases])
        /// The fields to include for returned resources of type backgroundAssetVersionExternalBetaReleases
        case backgroundAssetVersionExternalBetaReleases([BackgroundAssetVersionExternalBetaReleases])
        /// The fields to include for returned resources of type backgroundAssetVersionInternalBetaReleases
        case backgroundAssetVersionInternalBetaReleases([BackgroundAssetVersionInternalBetaReleases])
        /// The fields to include for returned resources of type backgroundAssetVersions
        case backgroundAssetVersions([BackgroundAssetVersions])
        /// The fields to include for returned resources of type backgroundAssets
        case backgroundAssets([BackgroundAssets])

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

        public enum BackgroundAssetVersionAppStoreReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case backgroundAssetVersion
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BackgroundAssetVersionAppStoreReleases(rawValue: string) {
                    self = value
                } else if let value = BackgroundAssetVersionAppStoreReleases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BackgroundAssetVersionAppStoreReleases value: \(string)"
                    )
                }
            }
        }

        public enum BackgroundAssetVersionExternalBetaReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case backgroundAssetVersion
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BackgroundAssetVersionExternalBetaReleases(rawValue: string) {
                    self = value
                } else if let value = BackgroundAssetVersionExternalBetaReleases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BackgroundAssetVersionExternalBetaReleases value: \(string)"
                    )
                }
            }
        }

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

        public enum BackgroundAssets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersion
            case archived
            case assetPackIdentifier
            case createdDate
            case externalBetaVersion
            case internalBetaVersion
            case usedBytes
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BackgroundAssets(rawValue: string) {
                    self = value
                } else if let value = BackgroundAssets(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BackgroundAssets value: \(string)"
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
