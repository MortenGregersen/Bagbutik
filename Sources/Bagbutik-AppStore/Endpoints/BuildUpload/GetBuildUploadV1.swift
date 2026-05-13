import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Build Upload Information
     Get details about a specific build upload file for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildUploads-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildUploadV1(id: String,
                                 fields: [GetBuildUploadV1.Field]? = nil,
                                 includes: [GetBuildUploadV1.Include]? = nil) -> Request<BuildUploadResponse, ErrorResponse> {
        .init(
            path: "/v1/buildUploads/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetBuildUploadV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type buildUploadFiles
        case buildUploadFiles([BuildUploadFiles])
        /// The fields to include for returned resources of type buildUploads
        case buildUploads([BuildUploads])
        /// The fields to include for returned resources of type builds
        case builds([Builds])

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

        public enum BuildUploads: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDescriptionFile
            case assetFile
            case assetSpiFile
            case build
            case buildUploadFiles
            case cfBundleShortVersionString
            case cfBundleVersion
            case createdDate
            case platform
            case state
            case uploadedDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BuildUploads(rawValue: string) {
                    self = value
                } else if let value = BuildUploads(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BuildUploads value: \(string)"
                    )
                }
            }
        }

        public enum Builds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appEncryptionDeclaration
            case appStoreVersion
            case betaAppReviewSubmission
            case betaBuildLocalizations
            case betaGroups
            case buildAudienceType
            case buildBetaDetail
            case buildBundles
            case buildUpload
            case computedMinMacOsVersion
            case computedMinVisionOsVersion
            case diagnosticSignatures
            case expirationDate
            case expired
            case iconAssetToken
            case icons
            case individualTesters
            case lsMinimumSystemVersion
            case minOsVersion
            case perfPowerMetrics
            case preReleaseVersion
            case processingState
            case uploadedDate
            case usesNonExemptEncryption
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Builds(rawValue: string) {
                    self = value
                } else if let value = Builds(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Builds value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case assetDescriptionFile
        case assetFile
        case assetSpiFile
        case build
    }
}
