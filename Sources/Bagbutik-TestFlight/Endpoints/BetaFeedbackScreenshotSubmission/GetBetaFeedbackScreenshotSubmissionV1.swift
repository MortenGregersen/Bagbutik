import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read a Beta Feedback Screenshot Submission
     Get information for a specific beta feedback screenshot submission.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaFeedbackScreenshotSubmissions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaFeedbackScreenshotSubmissionV1(id: String,
                                                      fields: [GetBetaFeedbackScreenshotSubmissionV1.Field]? = nil,
                                                      includes: [GetBetaFeedbackScreenshotSubmissionV1.Include]? = nil) -> Request<BetaFeedbackScreenshotSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/betaFeedbackScreenshotSubmissions/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetBetaFeedbackScreenshotSubmissionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type betaFeedbackScreenshotSubmissions
        case betaFeedbackScreenshotSubmissions([BetaFeedbackScreenshotSubmissions])
        /// The fields to include for returned resources of type betaTesters
        case betaTesters([BetaTesters])
        /// The fields to include for returned resources of type builds
        case builds([Builds])

        public enum BetaFeedbackScreenshotSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPlatform
            case appUptimeInMilliseconds
            case architecture
            case batteryPercentage
            case build
            case buildBundleId
            case comment
            case connectionType
            case createdDate
            case deviceFamily
            case deviceModel
            case devicePlatform
            case diskBytesAvailable
            case diskBytesTotal
            case email
            case locale
            case osVersion
            case pairedAppleWatch
            case screenHeightInPoints
            case screenWidthInPoints
            case screenshots
            case tester
            case timeZone

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaFeedbackScreenshotSubmissions(rawValue: string) {
                    self = value
                } else if let value = BetaFeedbackScreenshotSubmissions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaFeedbackScreenshotSubmissions value: \(string)"
                    )
                }
            }
        }

        public enum BetaTesters: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appDevices
            case apps
            case betaGroups
            case builds
            case email
            case firstName
            case inviteType
            case lastName
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BetaTesters(rawValue: string) {
                    self = value
                } else if let value = BetaTesters(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BetaTesters value: \(string)"
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
        case tester
    }
}
