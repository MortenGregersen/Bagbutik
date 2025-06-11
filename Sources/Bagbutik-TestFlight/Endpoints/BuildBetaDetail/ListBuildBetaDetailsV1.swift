import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Build Beta Details
     Find and list build beta details for all builds.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildBetaDetails>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildBetaDetailsV1(fields: [ListBuildBetaDetailsV1.Field]? = nil,
                                       filters: [ListBuildBetaDetailsV1.Filter]? = nil,
                                       includes: [ListBuildBetaDetailsV1.Include]? = nil,
                                       limit: Int? = nil) -> Request<BuildBetaDetailsResponse, ErrorResponse> {
        .init(
            path: "/v1/buildBetaDetails",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListBuildBetaDetailsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type buildBetaDetails
        case buildBetaDetails([BuildBetaDetails])
        /// The fields to include for returned resources of type builds
        case builds([Builds])

        public enum BuildBetaDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case autoNotifyEnabled
            case build
            case externalBuildState
            case internalBuildState
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
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'build'
        case build([String])
        /// Filter by id(s)
        case id([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case build
    }
}
