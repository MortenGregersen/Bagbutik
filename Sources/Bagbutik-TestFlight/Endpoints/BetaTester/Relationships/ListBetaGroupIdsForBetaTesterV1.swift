import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get All Beta Group IDs of a Beta Tester's Groups
     Get a list of group resource IDs associated with a beta tester.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaTesters-_id_-relationships-betaGroups>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaGroupIdsForBetaTesterV1(id: String,
                                                limit: Int? = nil) -> Request<BetaTesterBetaGroupsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/betaTesters/\(id)/relationships/betaGroups",
            method: .get,
            parameters: .init(limit: limit))
    }
}
