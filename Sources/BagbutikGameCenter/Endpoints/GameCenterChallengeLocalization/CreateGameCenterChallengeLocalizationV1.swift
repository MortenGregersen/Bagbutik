import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Add a Challenge Localization

     Add a localization for a specific Game Center challenge.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterChallengeLocalizations>

     - Parameter requestBody: GameCenterChallengeLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterChallengeLocalizationV1(requestBody: GameCenterChallengeLocalizationCreateRequest) -> Request<GameCenterChallengeLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
