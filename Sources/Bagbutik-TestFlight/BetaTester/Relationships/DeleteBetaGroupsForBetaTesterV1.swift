import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove a Beta Tester from Beta Groups
     Remove a specific beta tester from one or more beta groups, revoking their access to test builds associated with those groups.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/remove_a_beta_tester_from_beta_groups>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaGroupsForBetaTesterV1(id: String,
                                                requestBody: BetaTesterBetaGroupsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/betaTesters/\(id)/relationships/betaGroups", method: .delete, requestBody: requestBody)
    }
}
