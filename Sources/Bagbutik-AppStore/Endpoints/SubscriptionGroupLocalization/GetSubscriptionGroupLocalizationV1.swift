import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Subscription Group Localization Information
     Get the specific localized subscription group display name and optional custom app name for a subscription group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionGroupLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionGroupLocalizationV1(id: String,
                                                   fields: [GetSubscriptionGroupLocalizationV1.Field]? = nil,
                                                   includes: [GetSubscriptionGroupLocalizationV1.Include]? = nil) -> Request<SubscriptionGroupLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroupLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetSubscriptionGroupLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionGroupLocalizations
        case subscriptionGroupLocalizations([SubscriptionGroupLocalizations])
        /// The fields to include for returned resources of type subscriptionGroups
        case subscriptionGroups([SubscriptionGroups])

        public enum SubscriptionGroupLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customAppName
            case locale
            case name
            case state
            case subscriptionGroup

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

        public enum SubscriptionGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case referenceName
            case subscriptionGroupLocalizations
            case subscriptions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionGroups(rawValue: string) {
                    self = value
                } else if let value = SubscriptionGroups(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionGroups value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscriptionGroup
    }
}
