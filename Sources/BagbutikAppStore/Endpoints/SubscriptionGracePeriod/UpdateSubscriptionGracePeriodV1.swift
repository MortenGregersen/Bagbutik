import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify the billing grace period opt-in status and duration

     Change the Boolean value representing the billing grace period opt-in status.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/subscriptionGracePeriods/6446671329
     -d $'{
       "data": {
         "type": "subscriptionGracePeriods",
         "id": "6446671329",
         "attributes": {
           "sandboxOptIn": true,
           "optIn": true,
           "renewalType": "PAID_TO_PAID_ONLY",
           "duration": "TWENTY_EIGHT_DAYS"
         }
       }
     }'
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "subscriptionGracePeriods",
         "id" : "6446671329",
         "attributes" : {
           "optIn" : true,
           "sandboxOptIn" : true,
           "duration" : "TWENTY_EIGHT_DAYS",
           "renewalType" : "PAID_TO_PAID_ONLY"
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
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionGracePeriods-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionGracePeriod representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionGracePeriodV1(id: String,
                                                requestBody: SubscriptionGracePeriodUpdateRequest) -> Request<SubscriptionGracePeriodResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGracePeriods/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
