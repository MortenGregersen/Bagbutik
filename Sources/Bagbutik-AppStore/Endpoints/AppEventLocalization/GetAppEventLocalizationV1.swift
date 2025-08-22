import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appEventLocalizations/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEventLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEventLocalizationV1(id: String,
                                          fields: [GetAppEventLocalizationV1.Field]? = nil,
                                          includes: [GetAppEventLocalizationV1.Include]? = nil,
                                          limits: [GetAppEventLocalizationV1.Limit]? = nil) -> Request<AppEventLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetAppEventLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEventLocalizations
        case appEventLocalizations([AppEventLocalizations])
        /// The fields to include for returned resources of type appEventScreenshots
        case appEventScreenshots([AppEventScreenshots])
        /// The fields to include for returned resources of type appEventVideoClips
        case appEventVideoClips([AppEventVideoClips])

        public enum AppEventLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appEvent
            case appEventScreenshots
            case appEventVideoClips
            case locale
            case longDescription
            case name
            case shortDescription

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppEventLocalizations(rawValue: string) {
                    self = value
                } else if let value = AppEventLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppEventLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum AppEventScreenshots: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appEventAssetType
            case appEventLocalization
            case assetDeliveryState
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppEventScreenshots(rawValue: string) {
                    self = value
                } else if let value = AppEventScreenshots(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppEventScreenshots value: \(string)"
                    )
                }
            }
        }

        public enum AppEventVideoClips: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appEventAssetType
            case appEventLocalization
            case assetDeliveryState
            case fileName
            case fileSize
            case previewFrameImage
            case previewFrameTimeCode
            case previewImage
            case uploadOperations
            case videoDeliveryState
            case videoUrl

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppEventVideoClips(rawValue: string) {
                    self = value
                } else if let value = AppEventVideoClips(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppEventVideoClips value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appEvent
        case appEventScreenshots
        case appEventVideoClips
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appEventScreenshots returned (when they are included) - maximum 50
        case appEventScreenshots(Int)
        /// Maximum number of related appEventVideoClips returned (when they are included) - maximum 50
        case appEventVideoClips(Int)
    }
}
