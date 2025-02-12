import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a Beta Tester to Beta Groups
     Add one or more beta testers to a specific beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaTesters-_id_-relationships-betaGroups>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaGroupsForBetaTesterV1(id: String,
                                                requestBody: BetaTesterBetaGroupsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/betaTesters/\(id)/relationships/betaGroups", method: .post, requestBody: requestBody)
    }
}
