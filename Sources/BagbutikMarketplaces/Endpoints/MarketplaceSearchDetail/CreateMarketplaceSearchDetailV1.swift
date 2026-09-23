import BagbutikCore
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Add a marketplace search detail url

     Add a search detail URL for the alternative marketplace.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/marketplaceSearchDetails
     {
       "data": {
         "type": "marketplaceSearchDetails",
         "attributes": {
           "catalogUrl": "https://example.com/crawler-site/sitemap.xml"
         },
         "relationships": {
           "app": {
             "data": {
               "type": "apps",
               "id": "6476788026"
             }
           }
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       “data” : {
         “type” : “marketplaceSearchDetails”,
         “id” : “cfcfc44f-8291-4b75-84f0-4d9a55e8b878”,
         “attributes” : {
           “catalogUrl” : “https://example.com/crawler-site/sitemap.xml”
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/marketplaceSearchDetails/cfcfc44f-8291-4b75-84f0-4d9a55e8b878”
         }
       },
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/apps/6476788026/marketplaceSearchDetail”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-marketplaceSearchDetails>

     - Parameter requestBody: MarketplaceSearchDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createMarketplaceSearchDetailV1(requestBody: MarketplaceSearchDetailCreateRequest) -> Request<MarketplaceSearchDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/marketplaceSearchDetails",
            method: .post,
            requestBody: requestBody)
    }
}
