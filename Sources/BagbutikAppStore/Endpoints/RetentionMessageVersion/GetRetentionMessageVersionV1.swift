import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read a retention message version

     Read details about a specific retention message version, including its review state.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-retentionMessageVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related localizations returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRetentionMessageVersionV1(id: String,
                                             fields: [GetRetentionMessageVersionV1.Field]? = nil,
                                             includes: [GetRetentionMessageVersionV1.Include]? = nil,
                                             limit: GetRetentionMessageVersionV1.Limit? = nil) -> Request<RetentionMessageVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessageVersions/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetRetentionMessageVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAssetLibraryPlacements
        case appAssetLibraryPlacements([AppAssetLibraryPlacements])
        /// The fields to include for returned resources of type retentionMessageLocalizations
        case retentionMessageLocalizations([RetentionMessageLocalizations])
        /// The fields to include for returned resources of type retentionMessageVersions
        case retentionMessageVersions([RetentionMessageVersions])
        /// The fields to include for returned resources of type retentionMessages
        case retentionMessages([RetentionMessages])

        public enum AppAssetLibraryPlacements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageLocalization
            case appEventLocalization
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case createdDate
            case image
            case lastModifiedDate
            case mediaType
            case placementGroup
            case placementType
            case retentionMessageVersion
            case state
            case stateDetails
            case video

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppAssetLibraryPlacements(rawValue: string) {
                    self = value
                } else if let value = AppAssetLibraryPlacements(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppAssetLibraryPlacements value: \(string)"
                    )
                }
            }
        }

        public enum RetentionMessageLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case body
            case header
            case locale
            case retentionMessageVersion

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = RetentionMessageLocalizations(rawValue: string) {
                    self = value
                } else if let value = RetentionMessageLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid RetentionMessageLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum RetentionMessageVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case localizations
            case placement
            case retentionMessage
            case state

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = RetentionMessageVersions(rawValue: string) {
                    self = value
                } else if let value = RetentionMessageVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid RetentionMessageVersions value: \(string)"
                    )
                }
            }
        }

        public enum RetentionMessages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case referenceName
            case subscriptions
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = RetentionMessages(rawValue: string) {
                    self = value
                } else if let value = RetentionMessages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid RetentionMessages value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case localizations
        case placement
        case retentionMessage
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
    }
}
