import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List the image IDs for an app asset library

     Get a list of image asset resource IDs for a specific asset library.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/images?limit=2
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appAssetLibraryImages",
         "id" : "f4000005-e036-8f0b-8018-d259974bee61"
       }, {
         "type" : "appAssetLibraryImages",
         "id" : "c3000005-e036-8f0b-8038-36fbc8d1c4ae"
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/images",
         "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/images"
       },
       "meta" : {
         "paging" : {
           "total" : 2,
           "limit" : 2
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appAssetLibraries-_id_-relationships-images>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listImageIdsForAppAssetLibraryV1(id: String,
                                                 limit: Int? = nil) -> Request<AppAssetLibraryImagesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraries/\(id)/relationships/images",
            method: .get,
            parameters: .init(limit: limit))
    }
}
