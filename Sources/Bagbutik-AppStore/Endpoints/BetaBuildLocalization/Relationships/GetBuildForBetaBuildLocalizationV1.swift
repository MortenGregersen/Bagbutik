import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Build Information of a Beta Build Localization
     Get the build information for a specific beta build localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaBuildLocalizations-_id_-build>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildForBetaBuildLocalizationV1(id: String,
                                                   fields: [GetBuildForBetaBuildLocalizationV1.Field]? = nil) -> Request<BuildWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/betaBuildLocalizations/\(id)/build",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetBuildForBetaBuildLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type builds
        case builds([Builds])

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
}
