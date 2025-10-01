import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Builds for a Beta Group
     Get a list of builds associated with a specific beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaGroups-_id_-builds>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildsForBetaGroupV1(id: String,
                                         fields: [ListBuildsForBetaGroupV1.Field]? = nil,
                                         limit: Int? = nil) -> Request<BuildsWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups/\(id)/builds",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListBuildsForBetaGroupV1 {
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
}
