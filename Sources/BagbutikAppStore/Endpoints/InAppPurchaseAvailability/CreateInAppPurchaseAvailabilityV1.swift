import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify the Territory Availablity of an In-App Purchase

     Update the territory availablity of a specific in-app purchase.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities -d
     {
       "data": {
         "type": "inAppPurchaseAvailabilities",
         "attributes": {
           "availableInNewTerritories": true
         },
         "relationships": {
           "availableTerritories": {
             "data": [
               {
                 "type": "territories",
                 "id": "USA"
               },
               {
                 "type": "territories",
                 "id": "CAN"
               },
               {
                 "type": "territories",
                 "id": "ISL"
               }
             ]
           },
           "inAppPurchase": {
             "data": {
               "id": "6447501593",
               "type": "inAppPurchases"
             }
           }
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "inAppPurchaseAvailabilities",
         "id" : "6447501593",
         "attributes" : {
           "availableInNewTerritories" : true
         },
         "relationships" : {
           "availableTerritories" : {
             "links" : {
               "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593/relationships/availableTerritories",
               "related" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593/availableTerritories"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities/6447501593"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/inAppPurchaseAvailabilities"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseAvailabilities>

     - Parameter requestBody: InAppPurchaseAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseAvailabilityV1(requestBody: InAppPurchaseAvailabilityCreateRequest) -> Request<InAppPurchaseAvailabilityResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseAvailabilities",
            method: .post,
            requestBody: requestBody)
    }
}
