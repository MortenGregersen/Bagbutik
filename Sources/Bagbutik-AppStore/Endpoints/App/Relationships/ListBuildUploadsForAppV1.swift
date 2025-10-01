import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all build uploads for an app
     Get a list of all build uploads for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-buildUploads>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildUploadsForAppV1(id: String,
                                         fields: [ListBuildUploadsForAppV1.Field]? = nil,
                                         filters: [ListBuildUploadsForAppV1.Filter]? = nil,
                                         includes: [ListBuildUploadsForAppV1.Include]? = nil,
                                         sorts: [ListBuildUploadsForAppV1.Sort]? = nil,
                                         limit: Int? = nil) -> Request<BuildUploadsResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/buildUploads",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limit: limit))
    }
}

public enum ListBuildUploadsForAppV1 {
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'cfBundleShortVersionString'
        case cfBundleShortVersionString([String])
        /// Filter by attribute 'cfBundleVersion'
        case cfBundleVersion([String])
        /// Filter by attribute 'platform'
        case platform([Platform])
        /// Filter by state
        case state([String])
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

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case cfBundleVersionAscending = "cfBundleVersion"
        case cfBundleVersionDescending = "-cfBundleVersion"
        case uploadedDateAscending = "uploadedDate"
        case uploadedDateDescending = "-uploadedDate"
    }
}
