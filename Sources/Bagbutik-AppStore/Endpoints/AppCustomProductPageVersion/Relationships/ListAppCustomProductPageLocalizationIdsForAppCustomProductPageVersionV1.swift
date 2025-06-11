import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appCustomProductPageVersions/{id}/relationships/appCustomProductPageLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCustomProductPageVersions-_id_-relationships-appCustomProductPageLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppCustomProductPageLocalizationIdsForAppCustomProductPageVersionV1(id: String,
                                                                                        limit: Int? = nil) -> Request<AppCustomProductPageVersionAppCustomProductPageLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageVersions/\(id)/relationships/appCustomProductPageLocalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
