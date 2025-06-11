import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appEvents/{id}/relationships/localizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEvents-_id_-relationships-localizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationIdsForAppEventV1(id: String,
                                                 limit: Int? = nil) -> Request<AppEventLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appEvents/\(id)/relationships/localizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
