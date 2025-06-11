import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Build Beta Details Information of a Build
     Get the beta test details for a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-buildBetaDetail>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildBetaDetailForBuildV1(id: String,
                                             fields: [GetBuildBetaDetailForBuildV1.Field]? = nil,
                                             includes: [GetBuildBetaDetailForBuildV1.Include]? = nil) -> Request<BuildBetaDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/buildBetaDetail",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetBuildBetaDetailForBuildV1 {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case build
    }
}
