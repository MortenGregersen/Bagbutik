import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify an Activity

     Update details for a specific Game Center activity.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterActivities-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterActivity representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterActivityV1(id: String,
                                           requestBody: GameCenterActivityUpdateRequest) -> Request<GameCenterActivityResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
