import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an App Custom Product Page

     Update the name and visibility status of an app custom product page.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/appCustomProductPages/eb2b3606-2fef-4aab-a54e-b2e5547c9bc3
     {
       "data": {
         "type": "appCustomProductPages",
         "id": "eb2b3606-2fef-4aab-a54e-b2e5547c9bc3",
         "attributes": {
           "name": "Custom Product Page May 1",
           "visible": false
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "appCustomProductPages",
         "id": "eb2b3606-2fef-4aab-a54e-b2e5547c9bc3",
         "attributes": {
           "name": "Custom Product Page May 1",
           "url": "https://apps.apple.com/us/app/name/id01234?ppid=eb2b3606-2fef-4aab-a54e-b2e5547c9bc3",
           "visible": false
         },
         "relationships": {
           "appCustomProductPageVersions": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/eb2b3606-2fef-4aab-a54e-b2e5547c9bc3/relationships/appCustomProductPageVersions",
               "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/eb2b3606-2fef-4aab-a54e-b2e5547c9bc3/appCustomProductPageVersions"
             }
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/eb2b3606-2fef-4aab-a54e-b2e5547c9bc3"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPages/eb2b3606-2fef-4aab-a54e-b2e5547c9bc3"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appCustomProductPages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppCustomProductPage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppCustomProductPageV1(id: String,
                                             requestBody: AppCustomProductPageUpdateRequest) -> Request<AppCustomProductPageResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
