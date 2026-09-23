import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Clear purchase history for a sandbox tester

     Remove purchase history from a Sandbox Apple Account.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v2/sandboxTestersClearPurchaseHistoryRequest
     -d
     {
       "data": {
         "type": "sandboxTestersClearPurchaseHistoryRequest",
         "relationships": {
           "sandboxTesters": {
             "data": [
               {
                 "id": "47be9e57-1a3f-49c2-8ce7-af27a977ebb0",
                 "type": "sandboxTesters"
               }
             ]
           }
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "sandboxTestersClearPurchaseHistoryRequest",
         "id" : "c47f2eda-042e-4f4b-9bb9-ded24c507e41",
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/sandboxTestersClearPurchaseHistoryRequest/c47f2eda-042e-4f4b-9bb9-ded24c507e41"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v2/sandboxTestersClearPurchaseHistoryRequest"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-sandboxTestersClearPurchaseHistoryRequest>

     - Parameter requestBody: SandboxTestersClearPurchaseHistoryRequest representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSandboxTestersClearPurchaseHistoryRequestV2(requestBody: SandboxTestersClearPurchaseHistoryRequestV2CreateRequest) -> Request<SandboxTestersClearPurchaseHistoryRequestV2Response, ErrorResponse> {
        .init(
            path: "/v2/sandboxTestersClearPurchaseHistoryRequest",
            method: .post,
            requestBody: requestBody)
    }
}
