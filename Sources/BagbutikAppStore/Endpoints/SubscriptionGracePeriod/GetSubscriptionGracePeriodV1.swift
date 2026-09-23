import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the billing grace period value

     Get the Boolean value that represents the billing grace period opt-in state and the duration of the billing grace period.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/subscriptionGracePeriods/6446671329
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "subscriptionGracePeriods",
         "id" : "6446671329",
         "attributes" : {
           "optIn" : true,
           "sandboxOptIn" : false,
           "duration" : "THREE_DAYS",
           "renewalType" : "ALL_RENEWALS"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionGracePeriods/6446671329"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/subscriptionGracePeriods/6446671329"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionGracePeriods-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionGracePeriodV1(id: String,
                                             fields: [GetSubscriptionGracePeriodV1.Field]? = nil) -> Request<SubscriptionGracePeriodResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGracePeriods/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetSubscriptionGracePeriodV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionGracePeriods
        case subscriptionGracePeriods([SubscriptionGracePeriods])

        public enum SubscriptionGracePeriods: String, Sendable, ParameterValue, Codable, CaseIterable {
            case duration
            case optIn
            case renewalType
            case sandboxOptIn

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionGracePeriods(rawValue: string) {
                    self = value
                } else if let value = SubscriptionGracePeriods(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionGracePeriods value: \(string)"
                    )
                }
            }
        }
    }
}
