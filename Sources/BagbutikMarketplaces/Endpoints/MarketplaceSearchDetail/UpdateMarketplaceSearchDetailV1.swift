import BagbutikCore
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Modify a marketplace search detail url

     Update the search detail URL for the alternative marketplace.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/marketplaceSearchDetails/cfcfc44f-8291-4b75-84f0-4d9a55e8b878
     {
       "data": {
         "type": "marketplaceSearchDetails",
         "id": "cfcfc44f-8291-4b75-84f0-4d9a55e8b878",
         "attributes": {
           "catalogUrl": "https://example2.com/crawler-site/sitemap.xml"
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "marketplaceSearchDetails",
         "id": "cfcfc44f-8291-4b75-84f0-4d9a55e8b878",
         "attributes": {
           "catalogUrl": "https://example2.com/crawler-site/sitemap.xml"
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/marketplaceSearchDetails/cfcfc44f-8291-4b75-84f0-4d9a55e8b878"
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-marketplaceSearchDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: MarketplaceSearchDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateMarketplaceSearchDetailV1(id: String,
                                                requestBody: MarketplaceSearchDetailUpdateRequest) -> Request<MarketplaceSearchDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/marketplaceSearchDetails/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
