import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a challenge
     Remove a specific Game Center challenge.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterChallenges-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterChallengeV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallenges/\(id)",
            method: .delete)
    }
}
