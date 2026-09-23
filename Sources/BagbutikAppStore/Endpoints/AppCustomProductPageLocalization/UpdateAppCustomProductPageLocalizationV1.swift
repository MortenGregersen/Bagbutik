import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify Custom Product Page Localization Information

     Update the promotional text for an app custom product page localization.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c
     {
         "data": {
             "id": "736966e2-178b-4e3f-bfb9-474eb19fbd8c",
             "type": "appCustomProductPageLocalizations",
             "attributes": {
                 "promotionalText": "Ogenblik!"
             }
         }
     }
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "appCustomProductPageLocalizations",
         "id": "736966e2-178b-4e3f-bfb9-474eb19fbd8c",
         "attributes": {
           "locale": "nl-NL",
           "promotionalText": "Ogenblik!"
         },
         "relationships": {
           "appScreenshotSets": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c/relationships/appScreenshotSets",
               "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c/appScreenshotSets"
             }
           },
           "appPreviewSets": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c/relationships/appPreviewSets",
               "related": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c/appPreviewSets"
             }
           }
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/appCustomProductPageLocalizations/736966e2-178b-4e3f-bfb9-474eb19fbd8c"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appCustomProductPageLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppCustomProductPageLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppCustomProductPageLocalizationV1(id: String,
                                                         requestBody: AppCustomProductPageLocalizationUpdateRequest) -> Request<AppCustomProductPageLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
