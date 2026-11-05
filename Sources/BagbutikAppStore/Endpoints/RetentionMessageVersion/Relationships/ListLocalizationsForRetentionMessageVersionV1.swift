import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List localizations for a retention message version

     Get a list of localizations for a specific retention message version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-retentionMessageVersions-_id_-localizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationsForRetentionMessageVersionV1(id: String,
                                                              fields: [ListLocalizationsForRetentionMessageVersionV1.Field]? = nil,
                                                              includes: [ListLocalizationsForRetentionMessageVersionV1.Include]? = nil,
                                                              limit: Int? = nil) -> Request<RetentionMessageLocalizationsResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessageVersions/\(id)/localizations",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListLocalizationsForRetentionMessageVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type retentionMessageLocalizations
        case retentionMessageLocalizations([RetentionMessageLocalizations])
        /// The fields to include for returned resources of type retentionMessageVersions
        case retentionMessageVersions([RetentionMessageVersions])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case retentionMessageVersion
    }
}
