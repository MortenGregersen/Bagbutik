import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read subscription localization information
     Get the display name and description for a specific locale of a subscription configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-subscriptionLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionLocalizationsV2(id: String,
                                               fields: [GetSubscriptionLocalizationsV2.Field]? = nil,
                                               includes: [GetSubscriptionLocalizationsV2.Include]? = nil) -> Request<SubscriptionLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/subscriptionLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetSubscriptionLocalizationsV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionLocalizations
        case subscriptionLocalizations([SubscriptionLocalizations])
        /// The fields to include for returned resources of type subscriptionVersions
        case subscriptionVersions([SubscriptionVersions])

        public enum SubscriptionLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case locale
            case name
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionLocalizations(rawValue: string) {
                    self = value
                } else if let value = SubscriptionLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum SubscriptionVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case image
            case images
            case localizations
            case state
            case subscription
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionVersions(rawValue: string) {
                    self = value
                } else if let value = SubscriptionVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionVersions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case version
    }
}
