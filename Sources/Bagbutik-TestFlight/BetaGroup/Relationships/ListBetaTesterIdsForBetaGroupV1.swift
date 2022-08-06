import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get All Beta Tester IDs in a Beta Group
     Get a list of the beta tester resource IDs in a specific beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_all_beta_tester_ids_in_a_beta_group>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaTesterIdsForBetaGroupV1(id: String,
                                                limit: Int? = nil) -> Request<BetaGroupBetaTestersLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/betaGroups/\(id)/relationships/betaTesters", method: .get, parameters: .init(limit: limit))
    }
}
