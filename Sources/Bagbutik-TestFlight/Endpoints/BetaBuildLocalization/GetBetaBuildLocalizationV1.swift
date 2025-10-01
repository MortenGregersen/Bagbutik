import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Beta Build Localization Information
     Get a specific beta build localization resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaBuildLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaBuildLocalizationV1(id: String,
                                           fields: [GetBetaBuildLocalizationV1.Field]? = nil,
                                           includes: [GetBetaBuildLocalizationV1.Include]? = nil) -> Request<BetaBuildLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/betaBuildLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetBetaBuildLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaBuildLocalizations
        case betaBuildLocalizations([BetaBuildLocalizations])
        /// The fields to include for returned resources of type builds
        case builds([Builds])

        public enum BetaBuildLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case build
            case locale
            case whatsNew

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaBuildLocalizations(rawValue: string) {
                    self = value
                } else if let value = BetaBuildLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaBuildLocalizations value: \(string)"
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
        case build
    }
}
