import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove Compatible Versions from a Game Center Enabled Version

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/remove_compatible_versions_from_a_game_center_enabled_version>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func deleteCompatibleVersionsForGameCenterEnabledVersionV1(id: String,
                                                                      requestBody: GameCenterEnabledVersionCompatibleVersionsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterEnabledVersions/\(id)/relationships/compatibleVersions", method: .delete, requestBody: requestBody)
    }
}
