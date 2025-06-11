import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the challenges minimum platform version for a Game Center detail
     Update the relationship between a challenges minimum platform version and a specific Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterDetails-_id_-relationships-challengesMinimumPlatformVersions>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceChallengesMinimumPlatformVersionsForGameCenterDetailV1(id: String,
                                                                              requestBody: GameCenterDetailChallengesMinimumPlatformVersionsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/challengesMinimumPlatformVersions",
            method: .patch,
            requestBody: requestBody)
    }
}
