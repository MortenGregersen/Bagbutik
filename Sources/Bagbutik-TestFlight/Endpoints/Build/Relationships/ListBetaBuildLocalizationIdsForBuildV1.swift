import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/builds/{id}/relationships/betaBuildLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-relationships-betaBuildLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaBuildLocalizationIdsForBuildV1(id: String,
                                                       limit: Int? = nil) -> Request<BuildBetaBuildLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/betaBuildLocalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
