import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the default image ID for a challenge version
     Get the default image ID for a specific Game Center challenge version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterChallengeVersions-_id_-relationships-defaultImage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getDefaultImageIdsForGameCenterChallengeVersionV1(id: String) -> Request<GameCenterChallengeVersionDefaultImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeVersions/\(id)/relationships/defaultImage",
            method: .get)
    }
}
