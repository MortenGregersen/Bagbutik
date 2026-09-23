import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Group

     Add a new group.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterGroups>

     - Parameter requestBody: GameCenterGroup representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterGroupV1(requestBody: GameCenterGroupCreateRequest) -> Request<GameCenterGroupResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups",
            method: .post,
            requestBody: requestBody)
    }
}
