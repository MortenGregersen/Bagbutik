import BagbutikCore
import BagbutikAppStoreModels
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get the Game Center detail ID for an app

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-gameCenterDetail>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterDetailIdsForAppV1(id: String) -> Request<AppGameCenterDetailLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/gameCenterDetail",
            method: .get)
    }
}
