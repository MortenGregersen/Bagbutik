import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/ciProducts/{id}/relationships/primaryRepositories

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciProducts-_id_-relationships-primaryRepositories>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPrimaryRepositoryIdsForCiProductV1(id: String,
                                                       limit: Int? = nil) -> Request<CiProductPrimaryRepositoriesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/ciProducts/\(id)/relationships/primaryRepositories",
            method: .get,
            parameters: .init(limit: limit))
    }
}
