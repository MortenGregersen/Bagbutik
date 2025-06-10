import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add an activity version release
     Add a version release for a specific Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivityVersionReleases>

     - Parameter requestBody: GameCenterActivityVersionRelease representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterActivityVersionReleaseV1(requestBody: GameCenterActivityVersionReleaseCreateRequest) -> Request<GameCenterActivityVersionReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersionReleases",
            method: .post,
            requestBody: requestBody)
    }
}
