import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Subscription Localization Information
     Get the specific localized metadata for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_subscription_localization_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionLocalizationV1(id: String,
                                              fields: [GetSubscriptionLocalizationV1.Field]? = nil,
                                              includes: [GetSubscriptionLocalizationV1.Include]? = nil) -> Request<SubscriptionLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
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

        public enum SubscriptionLocalizations: String, ParameterValue, Codable, CaseIterable {
            case description
            case locale
            case name
            case state
            case subscription
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case subscription
    }
}
