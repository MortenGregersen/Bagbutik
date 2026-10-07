import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Get the asset library ID for an app

     Get the asset library resource ID for a specific app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/1234567890/relationships/assetLibrary
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "appAssetLibraries",
         "id" : "1234567890"
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/apps/1234567890/relationships/assetLibrary",
         "related" : "https://api.appstoreconnect.apple.com/v1/apps/1234567890/assetLibrary"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-assetLibrary>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAssetLibraryIdsForAppV1(id: String) -> Request<AppAssetLibraryLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/assetLibrary",
            method: .get)
    }
}
