import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read version details for a background asset
     Get details about a specific background asset version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-backgroundAssets-_id_-versions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionsForBackgroundAssetV1(id: String,
                                                 fields: [ListVersionsForBackgroundAssetV1.Field]? = nil,
                                                 filters: [ListVersionsForBackgroundAssetV1.Filter]? = nil,
                                                 includes: [ListVersionsForBackgroundAssetV1.Include]? = nil,
                                                 sorts: [ListVersionsForBackgroundAssetV1.Sort]? = nil,
                                                 limit: Int? = nil) -> Request<BackgroundAssetVersionsResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssets/\(id)/versions",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limit: limit))
    }
}

public enum ListVersionsForBackgroundAssetV1 {
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
            case assetPackIdentifier
            case createdDate
            case externalBetaVersion
            case internalBetaVersion
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'appStoreRelease.state'
        case appStoreRelease_state([BackgroundAssetVersionAppStoreReleaseState])
        /// Filter by attribute 'externalBetaRelease.state'
        case externalBetaRelease_state([BackgroundAssetVersionExternalBetaReleaseState])
        /// Filter by attribute 'internalBetaRelease.state'
        case internalBetaRelease_state([InternalBetaReleaseState])
        /// Filter by attribute 'state'
        case state([BackgroundAssetVersionState])
        /// Filter by attribute 'version'
        case version([String])

        public enum InternalBetaReleaseState: String, Sendable, ParameterValue, Codable, CaseIterable {
            case readyForTesting = "READY_FOR_TESTING"
            case superseded = "SUPERSEDED"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InternalBetaReleaseState(rawValue: string) {
                    self = value
                } else if let value = InternalBetaReleaseState(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InternalBetaReleaseState value: \(string)"
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

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case versionAscending = "version"
        case versionDescending = "-version"
    }
}
