import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Group

     Edit the reference name for a group.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterGroups-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterGroup representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterGroupV1(id: String,
                                        requestBody: GameCenterGroupUpdateRequest) -> Request<GameCenterGroupResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
