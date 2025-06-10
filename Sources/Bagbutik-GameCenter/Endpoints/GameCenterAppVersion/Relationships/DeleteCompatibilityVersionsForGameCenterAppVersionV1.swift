import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove a compatilibly version
     Remove a compatilible version relationship from an app version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterAppVersions-_id_-relationships-compatibilityVersions>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteCompatibilityVersionsForGameCenterAppVersionV1(id: String,
                                                                     requestBody: GameCenterAppVersionCompatibilityVersionsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAppVersions/\(id)/relationships/compatibilityVersions",
            method: .delete,
            requestBody: requestBody)
    }
}
