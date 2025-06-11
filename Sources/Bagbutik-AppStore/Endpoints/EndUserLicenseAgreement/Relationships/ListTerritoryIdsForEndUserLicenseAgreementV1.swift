import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/endUserLicenseAgreements/{id}/relationships/territories

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-endUserLicenseAgreements-_id_-relationships-territories>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTerritoryIdsForEndUserLicenseAgreementV1(id: String,
                                                             limit: Int? = nil) -> Request<EndUserLicenseAgreementTerritoriesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/endUserLicenseAgreements/\(id)/relationships/territories",
            method: .get,
            parameters: .init(limit: limit))
    }
}
