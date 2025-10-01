import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Store Version Localization Information
     Read localized version-level information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersionLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreVersionLocalizationV1(id: String,
                                                 fields: [GetAppStoreVersionLocalizationV1.Field]? = nil,
                                                 includes: [GetAppStoreVersionLocalizationV1.Include]? = nil,
                                                 limits: [GetAppStoreVersionLocalizationV1.Limit]? = nil) -> Request<AppStoreVersionLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetAppStoreVersionLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPreviewSets
        case appPreviewSets([AppPreviewSets])
        /// The fields to include for returned resources of type appScreenshotSets
        case appScreenshotSets([AppScreenshotSets])
        /// The fields to include for returned resources of type appStoreVersionLocalizations
        case appStoreVersionLocalizations([AppStoreVersionLocalizations])

        public enum AppPreviewSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageLocalization
            case appPreviews
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case previewType

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppPreviewSets(rawValue: string) {
                    self = value
                } else if let value = AppPreviewSets(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppPreviewSets value: \(string)"
                    )
                }
            }
        }

        public enum AppScreenshotSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageLocalization
            case appScreenshots
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case screenshotDisplayType

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppScreenshotSets(rawValue: string) {
                    self = value
                } else if let value = AppScreenshotSets(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppScreenshotSets value: \(string)"
                    )
                }
            }
        }

        public enum AppStoreVersionLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersion
            case description
            case keywords
            case locale
            case marketingUrl
            case promotionalText
            case searchKeywords
            case supportUrl
            case whatsNew

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppStoreVersionLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppStoreVersionLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppStoreVersionLocalizations value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appPreviewSets
        case appScreenshotSets
        case appStoreVersion
        case searchKeywords
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appPreviewSets returned (when they are included) - maximum 50
        case appPreviewSets(Int)
        /// Maximum number of related appScreenshotSets returned (when they are included) - maximum 50
        case appScreenshotSets(Int)
        /// Maximum number of related searchKeywords returned (when they are included) - maximum 50
        case searchKeywords(Int)
    }
}
