import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete an app asset library image

     Delete an app asset library image.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     DELETE https://api.appstoreconnect.apple.com/v1/appAssetLibraryImages/f4000005-e036-8f0b-8018-d259974bee61
     ```

     **Response:**

     ```
     HTTP/1.1 204 No Content
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appAssetLibraryImages-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppAssetLibraryImageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraryImages/\(id)",
            method: .delete)
    }
}
