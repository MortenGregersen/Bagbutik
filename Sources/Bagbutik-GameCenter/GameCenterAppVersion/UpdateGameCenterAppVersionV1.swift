import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an app version
     Change the state of Game Center enablement for an app version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_version>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAppVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterAppVersionV1(id: String,
                                             requestBody: GameCenterAppVersionUpdateRequest) -> Request<GameCenterAppVersionResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterAppVersions/\(id)", method: .patch, requestBody: requestBody)
    }
}
