import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Beta Build Localizations
     Find and list beta build localizations currently associated with apps.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaBuildLocalizations>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaBuildLocalizationsV1(fields: [ListBetaBuildLocalizationsV1.Field]? = nil,
                                             filters: [ListBetaBuildLocalizationsV1.Filter]? = nil,
                                             includes: [ListBetaBuildLocalizationsV1.Include]? = nil,
                                             limit: Int? = nil) -> Request<BetaBuildLocalizationsResponse, ErrorResponse> {
        .init(
            path: "/v1/betaBuildLocalizations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListBetaBuildLocalizationsV1 {
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
        /// Filter by id(s) of related 'build'
        case build([String])
        /// Filter by attribute 'locale'
        case locale([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case build
    }
}
