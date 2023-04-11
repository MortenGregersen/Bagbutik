import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Custom Offer Code Information
     Get details about a specific offer code for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_custom_offer_code_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionOfferCodeCustomCodeV1(id: String,
                                                     fields: [GetSubscriptionOfferCodeCustomCodeV1.Field]? = nil,
                                                     includes: [GetSubscriptionOfferCodeCustomCodeV1.Include]? = nil) -> Request<SubscriptionOfferCodeCustomCodeResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionOfferCodeCustomCodes/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                  includes: includes))
    }
}

public enum GetSubscriptionOfferCodeCustomCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionOfferCodeCustomCodes
        case subscriptionOfferCodeCustomCodes([SubscriptionOfferCodeCustomCodes])

        public enum SubscriptionOfferCodeCustomCodes: String, ParameterValue, Codable, CaseIterable {
            case active
            case createdDate
            case customCode
            case expirationDate
            case numberOfCodes
            case offerCode
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case offerCode
    }
}
