import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add Beta Testers to a Beta Group
     Add a specific beta tester to one or more beta groups for beta testing.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaGroups-_id_-relationships-betaTesters>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaTestersForBetaGroupV1(id: String,
                                                requestBody: BetaGroupBetaTestersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups/\(id)/relationships/betaTesters",
            method: .post,
            requestBody: requestBody)
    }
}
