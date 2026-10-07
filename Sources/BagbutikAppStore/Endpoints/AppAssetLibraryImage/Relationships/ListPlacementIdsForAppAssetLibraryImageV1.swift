import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List the placement IDs for an app asset library image

     Get a list of placement resource IDs for a specific app asset library image.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61/relationships/placements?limit=2
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appAssetLibraryPlacements",
         "id" : "2e000005-e036-8f0b-8f25-6dbc2baa784a"
       }, {
         "type" : "appAssetLibraryPlacements",
         "id" : "1e800005-e036-8f0b-8f37-9c5cc67e23a1"
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61/relationships/placements",
         "related" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61/placements"
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
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appAssetLibraryImages-_id_-relationships-placements>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPlacementIdsForAppAssetLibraryImageV1(id: String,
                                                          limit: Int? = nil) -> Request<AppAssetLibraryImagePlacementsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraryImages/\(id)/relationships/placements",
            method: .get,
            parameters: .init(limit: limit))
    }
}
