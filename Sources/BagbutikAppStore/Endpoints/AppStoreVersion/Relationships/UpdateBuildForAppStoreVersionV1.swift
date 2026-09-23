import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Modify the build for an app store version

     Change the build that is attached to a specific App Store version.

     ## Discussion

     Use this endpoint to associate a build with a version. The build you specify represents the build that’s installed when a customer purchases the app on the App Store.

     ### Attach a Build to a Version

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/build
     {
       "data": {
         "type": "builds",
         "id": "b539f38f-8af4-4fbd-b5fc-fde89aab410f"
       }
     }
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "builds",
         "id": "b539f38f-8af4-4fbd-b5fc-fde89aab410f"
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/build",
         "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/build"
       }
     }
     ```

     ### Remove the Build from a Version

     **Request:**

     ```
     PATCH /v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/build
     {
       "data": null
     }
     ```

     **Response:**

     ```json
     {
       "data": null,
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/relationships/build",
         "related": "https://api.appstoreconnect.apple.com/v1/appStoreVersions/f5b10fc0-afda-4b31-b3e8-cdbcbe945622/build"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appStoreVersions-_id_-relationships-build>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBuildForAppStoreVersionV1(id: String,
                                                requestBody: AppStoreVersionBuildLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/relationships/build",
            method: .patch,
            requestBody: requestBody)
    }
}
