import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get the default image ID for a Game Center activity version

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivityVersions-_id_-relationships-defaultImage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getDefaultImageIdsForGameCenterActivityVersionV1(id: String) -> Request<GameCenterActivityVersionDefaultImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersions/\(id)/relationships/defaultImage",
            method: .get)
    }
}
