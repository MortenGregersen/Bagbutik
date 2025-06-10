import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read One-Time Use Offer Code Information
     Get details about a specific one-time use offer code for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionOfferCodeOneTimeUseCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionOfferCodeOneTimeUseCodeV1(id: String,
                                                         fields: [GetSubscriptionOfferCodeOneTimeUseCodeV1.Field]? = nil,
                                                         includes: [GetSubscriptionOfferCodeOneTimeUseCodeV1.Include]? = nil) -> Request<SubscriptionOfferCodeOneTimeUseCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodeOneTimeUseCodes/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetSubscriptionOfferCodeOneTimeUseCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionOfferCodeOneTimeUseCodes
        case subscriptionOfferCodeOneTimeUseCodes([SubscriptionOfferCodeOneTimeUseCodes])

        public enum SubscriptionOfferCodeOneTimeUseCodes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case active
            case createdDate
            case expirationDate
            case numberOfCodes
            case offerCode
            case values
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case offerCode
        case values
    }
}
