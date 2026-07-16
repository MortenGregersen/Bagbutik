import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read subscription group localization information
     Get the custom name for a specific locale of a subscription group configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-subscriptionGroupLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionGroupLocalizationsV2(id: String,
                                                    fields: [GetSubscriptionGroupLocalizationsV2.Field]? = nil,
                                                    includes: [GetSubscriptionGroupLocalizationsV2.Include]? = nil) -> Request<SubscriptionGroupLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/subscriptionGroupLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetSubscriptionGroupLocalizationsV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionGroupLocalizations
        case subscriptionGroupLocalizations([SubscriptionGroupLocalizations])
        /// The fields to include for returned resources of type subscriptionGroupVersions
        case subscriptionGroupVersions([SubscriptionGroupVersions])

        public enum SubscriptionGroupLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customAppName
            case locale
            case name
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionGroupLocalizations(rawValue: string) {
                    self = value
                } else if let value = SubscriptionGroupLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionGroupLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum SubscriptionGroupVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case localizations
            case state
            case subscriptionGroup
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionGroupVersions(rawValue: string) {
                    self = value
                } else if let value = SubscriptionGroupVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionGroupVersions value: \(string)"
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
