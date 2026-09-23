import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify an Activity Version

     Update a specific activity version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterActivityVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterActivityVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterActivityVersionV1(id: String,
                                                  requestBody: GameCenterActivityVersionUpdateRequest) -> Request<GameCenterActivityVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersions/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
