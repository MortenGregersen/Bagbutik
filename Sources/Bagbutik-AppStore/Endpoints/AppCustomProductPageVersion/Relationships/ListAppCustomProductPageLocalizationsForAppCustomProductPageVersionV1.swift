import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List custom product pages localizations
     List all localizations for an app custom product page.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCustomProductPageVersions-_id_-appCustomProductPageLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppCustomProductPageLocalizationsForAppCustomProductPageVersionV1(id: String,
                                                                                      fields: [ListAppCustomProductPageLocalizationsForAppCustomProductPageVersionV1.Field]? = nil,
                                                                                      filters: [ListAppCustomProductPageLocalizationsForAppCustomProductPageVersionV1.Filter]? = nil,
                                                                                      includes: [ListAppCustomProductPageLocalizationsForAppCustomProductPageVersionV1.Include]? = nil,
                                                                                      limits: [ListAppCustomProductPageLocalizationsForAppCustomProductPageVersionV1.Limit]? = nil) -> Request<AppCustomProductPageLocalizationsResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageVersions/\(id)/appCustomProductPageLocalizations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListAppCustomProductPageLocalizationsForAppCustomProductPageVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCustomProductPageLocalizations
        case appCustomProductPageLocalizations([AppCustomProductPageLocalizations])
        /// The fields to include for returned resources of type appCustomProductPageVersions
        case appCustomProductPageVersions([AppCustomProductPageVersions])
        /// The fields to include for returned resources of type appPreviewSets
        case appPreviewSets([AppPreviewSets])
        /// The fields to include for returned resources of type appScreenshotSets
        case appScreenshotSets([AppScreenshotSets])

        public enum AppCustomProductPageLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageVersion
            case appPreviewSets
            case appScreenshotSets
            case locale
            case promotionalText

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppCustomProductPageLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppCustomProductPageLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppCustomProductPageLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum AppCustomProductPageVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPage
            case appCustomProductPageLocalizations
            case deepLink
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppCustomProductPageVersions(rawValue: string) {
                    self = value
                } else if let value = AppCustomProductPageVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppCustomProductPageVersions value: \(string)"
                    )
                }
            }
        }

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
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'locale'
        case locale([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appCustomProductPageVersion
        case appPreviewSets
        case appScreenshotSets
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appPreviewSets returned (when they are included) - maximum 50
        case appPreviewSets(Int)
        /// Maximum number of related appScreenshotSets returned (when they are included) - maximum 50
        case appScreenshotSets(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
