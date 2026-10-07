import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app asset library video

     Create an app asset library video.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos

     {
       "data": {
         "type": "appAssetLibraryVideos",
         "attributes": {
           "fileName": "app-preview-6-9.mp4",
           "fileSize": 31457280,
           "category": "APP_SCREENSHOTS_AND_PREVIEWS",
           "previewFrameTimeCode": "00:00:03:00",
           "referenceName": "Fall campaign preview"
         },
         "relationships": {
           "assetLibrary": {
             "data": {
               "type": "appAssetLibraries",
               "id": "1234567890"
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
         "type" : "appAssetLibraryVideos",
         "id" : "3b100005-e036-8f0b-8021-77aa41c6b502",
         "attributes" : {
           "category" : "APP_SCREENSHOTS_AND_PREVIEWS",
           "createdDate" : "2026-08-11T22:51:04Z",
           "lastModifiedDate" : "2026-08-11T22:51:04Z",
           "fileName" : "app-preview-6-9.mp4",
           "fileSize" : 31457280,
           "previewFrameImage" : null,
           "previewFrameTimeCode" : "00:00:03:00",
           "referenceName" : "Fall campaign preview",
           "specId" : null,
           "state" : "AWAITING_UPLOAD",
           "stateDetails" : null,
           "videoAsset" : null,
           "uploadOperations" : [ {
             "method" : "PUT",
             "url" : "https://store-030.blobstore.apple.com/assets/PurpleSource112/v4/8c/be/40/8cbe4070-6a92-e2ac-c88b-65834bf2eab5?uploadId=2bd6bf70-95d6-11f1-b9d8-7e19c51190cb&partNumber=1&Expires=1786488251",
             "length" : 31457280,
             "offset" : 0,
             "requestHeaders" : [ {
               "name" : "Content-Type",
               "value" : "video/mp4"
             } ]
           } ]
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos/3b100005-e036-8f0b-8021-77aa41c6b502"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appAssetLibraryVideos"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appAssetLibraryVideos>

     - Parameter requestBody: AppAssetLibraryVideo representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppAssetLibraryVideoV1(requestBody: AppAssetLibraryVideoCreateRequest) -> Request<AppAssetLibraryVideoResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraryVideos",
            method: .post,
            requestBody: requestBody)
    }
}
