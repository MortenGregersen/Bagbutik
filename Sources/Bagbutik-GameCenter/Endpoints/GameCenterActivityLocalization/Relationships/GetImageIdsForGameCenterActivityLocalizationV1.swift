import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterActivityLocalizations/{id}/relationships/image

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivityLocalizations-_id_-relationships-image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageIdsForGameCenterActivityLocalizationV1(id: String) -> Request<GameCenterActivityLocalizationImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityLocalizations/\(id)/relationships/image",
            method: .get)
    }
}
