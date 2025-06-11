import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appInfos/{id}/relationships/appInfoLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appInfos-_id_-relationships-appInfoLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppInfoLocalizationIdsForAppInfoV1(id: String,
                                                       limit: Int? = nil) -> Request<AppInfoAppInfoLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfos/\(id)/relationships/appInfoLocalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
