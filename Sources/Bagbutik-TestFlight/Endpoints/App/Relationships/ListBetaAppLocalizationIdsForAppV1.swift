import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/apps/{id}/relationships/betaAppLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-betaAppLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaAppLocalizationIdsForAppV1(id: String,
                                                   limit: Int? = nil) -> Request<AppBetaAppLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/betaAppLocalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
