import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Modify a sandbox tester

     Change the subscription renewal time rate, set interrupted purchases or change territory of Sandbox Apple Account.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v2/sandboxTesters/47be9e57-1a3f-49c2-8ce7-af27a977ebb0
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "sandboxTesters",
         "id" : "47be9e57-1a3f-49c2-8ce7-af27a977ebb0",
         "attributes" : {
           "firstName" : "Anne",
           "lastName" : "Johnson",
           "acAccountName" : "annejohnson1@icloud.com",
           "territory" : "CAN",
           "applePayCompatible" : true,
           "interruptPurchases" : false,
           "subscriptionRenewalRate" : "MONTHLY_RENEWAL_EVERY_THIRTY_MINUTES"
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/sandboxTesters/47be9e57-1a3f-49c2-8ce7-af27a977ebb0"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v2/sandboxTesters/47be9e57-1a3f-49c2-8ce7-af27a977ebb0"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-sandboxTesters-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SandboxTester representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSandboxTestersV2(id: String,
                                       requestBody: SandboxTesterV2UpdateRequest) -> Request<SandboxTesterV2Response, ErrorResponse> {
        .init(
            path: "/v2/sandboxTesters/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
