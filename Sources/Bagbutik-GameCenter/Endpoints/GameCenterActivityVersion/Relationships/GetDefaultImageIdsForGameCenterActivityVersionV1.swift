import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the default image ID for a Game Center activity version

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivityVersions-_id_-relationships-defaultImage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getDefaultImageIdsForGameCenterActivityVersionV1(id: String) -> Request<GameCenterActivityVersionDefaultImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersions/\(id)/relationships/defaultImage",
            method: .get)
    }
}
