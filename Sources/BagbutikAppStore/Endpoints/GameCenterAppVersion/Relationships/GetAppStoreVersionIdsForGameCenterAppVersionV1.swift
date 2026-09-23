import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Get the App Store version ID for a Game Center app version

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAppVersions-_id_-relationships-appStoreVersion>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreVersionIdsForGameCenterAppVersionV1(id: String) -> Request<GameCenterAppVersionAppStoreVersionLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAppVersions/\(id)/relationships/appStoreVersion",
            method: .get)
    }
}
