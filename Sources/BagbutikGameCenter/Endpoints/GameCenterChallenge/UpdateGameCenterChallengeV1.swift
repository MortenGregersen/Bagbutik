import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Challenge

     Update details for a specific Game Center challenge.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterChallenges-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterChallenge representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterChallengeV1(id: String,
                                            requestBody: GameCenterChallengeUpdateRequest) -> Request<GameCenterChallengeResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallenges/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
