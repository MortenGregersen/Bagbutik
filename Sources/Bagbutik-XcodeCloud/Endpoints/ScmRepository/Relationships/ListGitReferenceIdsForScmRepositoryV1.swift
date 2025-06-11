import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/scmRepositories/{id}/relationships/gitReferences

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-scmRepositories-_id_-relationships-gitReferences>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGitReferenceIdsForScmRepositoryV1(id: String,
                                                      limit: Int? = nil) -> Request<ScmRepositoryGitReferencesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/scmRepositories/\(id)/relationships/gitReferences",
            method: .get,
            parameters: .init(limit: limit))
    }
}
