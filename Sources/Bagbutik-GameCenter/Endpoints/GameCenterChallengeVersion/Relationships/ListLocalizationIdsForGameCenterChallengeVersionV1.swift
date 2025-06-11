import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the localization IDs for a challenge version
     List all the localization IDs for a specific Game Center challenge version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterChallengeVersions-_id_-relationships-localizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationIdsForGameCenterChallengeVersionV1(id: String,
                                                                   limit: Int? = nil) -> Request<GameCenterChallengeVersionLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeVersions/\(id)/relationships/localizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
