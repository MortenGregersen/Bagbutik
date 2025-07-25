import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appCustomProductPages/{id}/relationships/appCustomProductPageVersions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCustomProductPages-_id_-relationships-appCustomProductPageVersions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppCustomProductPageVersionIdsForAppCustomProductPageV1(id: String,
                                                                            limit: Int? = nil) -> Request<AppCustomProductPageAppCustomProductPageVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPages/\(id)/relationships/appCustomProductPageVersions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
