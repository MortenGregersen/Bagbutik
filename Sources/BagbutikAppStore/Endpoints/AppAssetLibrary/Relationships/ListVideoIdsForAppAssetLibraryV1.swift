import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List the video IDs for an app asset library

     Get a list of video asset resource IDs for a specific asset library.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/videos?limit=1
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appAssetLibraryVideos",
         "id" : "3b100005-e036-8f0b-8021-77aa41c6b502"
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/relationships/videos",
         "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraries/1234567890/videos"
       },
       "meta" : {
         "paging" : {
           "total" : 1,
           "limit" : 1
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appAssetLibraries-_id_-relationships-videos>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVideoIdsForAppAssetLibraryV1(id: String,
                                                 limit: Int? = nil) -> Request<AppAssetLibraryVideosLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraries/\(id)/relationships/videos",
            method: .get,
            parameters: .init(limit: limit))
    }
}
