import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a Custom Product Page Version

     Update the name and visibility status of an app custom product page.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     PATCH https://appstoreconnect.apple.com/v1/appCustomProductPageVersions/372e5398-047b-4793-951b-2935d8578ab2
     {
         "data": {
             "type": "appCustomProductPageVersions",
             "id": "372e5398-047b-4793-951b-2935d8578ab2",
             "attributes": {
                 "deepLink": "https://example.com/deeplink"
             }
         }
     }
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "appCustomProductPageVersions",
         "id" : "372e5398-047b-4793-951b-2935d8578ab2",
         "attributes" : {
           "version" : "3",
           "state" : "PREPARE_FOR_SUBMISSION",
           "deepLink" : "https://example.com/deeplink"
         },
         "relationships" : {
           "appCustomProductPageLocalizations" : {
             "links" : {
               "self" : "https://appstoreconnect.apple.com/v1/appCustomProductPageVersions/372e5398-047b-4793-951b-2935d8578ab2/relationships/appCustomProductPageLocalizations",
               "related" : "https://appstoreconnect.apple.com/v1/appCustomProductPageVersions/372e5398-047b-4793-951b-2935d8578ab2/appCustomProductPageLocalizations"
             }
           }
         },
         "links" : {
           "self" : "https://appstoreconnect.apple.com/v1/appCustomProductPageVersions/372e5398-047b-4793-951b-2935d8578ab2"
         }
       },
       "links" : {
         "self" : "https://appstoreconnect.apple.com/v1/appCustomProductPageVersions/372e5398-047b-4793-951b-2935d8578ab2"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appCustomProductPageVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppCustomProductPageVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppCustomProductPageVersionV1(id: String,
                                                    requestBody: AppCustomProductPageVersionUpdateRequest) -> Request<AppCustomProductPageVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageVersions/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
