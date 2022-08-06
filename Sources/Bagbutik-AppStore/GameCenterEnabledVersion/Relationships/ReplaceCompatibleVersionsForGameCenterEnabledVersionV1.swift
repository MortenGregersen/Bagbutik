import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Replace All Compatible Versions for a Game Center Enabled Version

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/replace_all_compatible_versions_for_a_game_center_enabled_version>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceCompatibleVersionsForGameCenterEnabledVersionV1(id: String,
                                                                       requestBody: GameCenterEnabledVersionCompatibleVersionsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterEnabledVersions/\(id)/relationships/compatibleVersions", method: .patch, requestBody: requestBody)
    }
}
