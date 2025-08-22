import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Subscription Localization Information
     Get the specific localized metadata for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionLocalizationV1(id: String,
                                              fields: [GetSubscriptionLocalizationV1.Field]? = nil,
                                              includes: [GetSubscriptionLocalizationV1.Include]? = nil) -> Request<SubscriptionLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetSubscriptionLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionLocalizations
        case subscriptionLocalizations([SubscriptionLocalizations])

        public enum SubscriptionLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case locale
            case name
            case state
            case subscription

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscription
    }
}
