import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/scmProviders/{id}/relationships/repositories

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-scmProviders-_id_-relationships-repositories>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listRepositoryIdsForScmProviderV1(id: String,
                                                  limit: Int? = nil) -> Request<ScmProviderRepositoriesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/scmProviders/\(id)/relationships/repositories",
            method: .get,
            parameters: .init(limit: limit))
    }
}
