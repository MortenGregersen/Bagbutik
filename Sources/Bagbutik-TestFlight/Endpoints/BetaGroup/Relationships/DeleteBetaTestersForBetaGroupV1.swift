import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove Beta Testers from a Beta Group
     Remove a specific beta tester from a one or more beta groups, revoking their access to test builds associated with those groups.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaGroups-_id_-relationships-betaTesters>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaTestersForBetaGroupV1(id: String,
                                                requestBody: BetaGroupBetaTestersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/betaGroups/\(id)/relationships/betaTesters", method: .delete, requestBody: requestBody)
    }
}
