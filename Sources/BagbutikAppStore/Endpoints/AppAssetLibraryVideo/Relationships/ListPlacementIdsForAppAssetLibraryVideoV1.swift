import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List the placement IDs for an app asset library video

     Get a list of placement resource IDs for a specific app asset library video.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/relationships/placements?limit=1
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appAssetLibraryPlacements",
         "id" : "2e000005-e036-8f0b-8f25-6dbc2baa784a"
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/relationships/placements",
         "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502/placements"
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
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appAssetLibraryVideos-_id_-relationships-placements>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPlacementIdsForAppAssetLibraryVideoV1(id: String,
                                                          limit: Int? = nil) -> Request<AppAssetLibraryVideoPlacementsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraryVideos/\(id)/relationships/placements",
            method: .get,
            parameters: .init(limit: limit))
    }
}
