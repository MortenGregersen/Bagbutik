import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get All Build IDs in a Beta Group
     Get a list of build resource IDs in a specific beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaGroups-_id_-relationships-builds>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildIdsForBetaGroupV1(id: String,
                                           limit: Int? = nil) -> Request<BetaGroupBuildsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups/\(id)/relationships/builds",
            method: .get,
            parameters: .init(limit: limit))
    }
}
