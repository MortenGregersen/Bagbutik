import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app asset library placement

     Create an app asset library placement.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacements

     {
       "data": {
         "type": "appAssetLibraryPlacements",
         "attributes": {
           "placementType": "APP_SCREENSHOT",
           "placementGroup": "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE"
         },
         "relationships": {
           "image": {
             "data": {
               "type": "appAssetLibraryImages",
               "id": "f4000005-e036-8f0b-8018-d259974bee61"
             }
           },
           "appStoreVersionLocalization": {
             "data": {
               "type": "appStoreVersionLocalizations",
               "id": "b3a9b4c2-d2de-43f4-ad8c-71c5ebe301d1"
             }
           }
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "appAssetLibraryPlacements",
         "id" : "2e000005-e036-8f0b-8f25-6dbc2baa784a",
         "attributes" : {
           "mediaType" : "IMAGE",
           "placementType" : "APP_SCREENSHOT",
           "placementGroup" : "IPHONE_DYNAMIC_ISLAND_LARGE_PROFILE",
           "createdDate" : "2026-08-11T22:45:27Z",
           "lastModifiedDate" : "2026-08-11T22:45:27Z",
           "state" : "PARENT_PREPARE_FOR_SUBMISSION",
           "stateDetails" : null
         },
         "relationships" : {
           "image" : {
             "data" : {
               "type" : "appAssetLibraryImages",
               "id" : "f4000005-e036-8f0b-8018-d259974bee61"
             }
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacements/2e000005-e036-8f0b-8f25-6dbc2baa784a"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacements"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appAssetLibraryPlacements>

     - Parameter requestBody: AppAssetLibraryPlacement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppAssetLibraryPlacementV1(requestBody: AppAssetLibraryPlacementCreateRequest) -> Request<AppAssetLibraryPlacementResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraryPlacements",
            method: .post,
            requestBody: requestBody)
    }
}
