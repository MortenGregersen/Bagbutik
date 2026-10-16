import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete an app asset library placement

     Delete an app asset library placement.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     DELETE https://api.appstoreconnect.apple.com/v1/appAssetLibraryPlacements/2e000005-e036-8f0b-8f25-6dbc2baa784a
     ```

     **Response:**

     ```
     HTTP/1.1 204 No Content
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appAssetLibraryPlacements-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppAssetLibraryPlacementV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appAssetLibraryPlacements/\(id)",
            method: .delete)
    }
}
