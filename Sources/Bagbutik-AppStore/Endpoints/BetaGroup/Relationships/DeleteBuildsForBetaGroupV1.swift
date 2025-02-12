import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove Builds from a Beta Group
     Remove access to test one or more builds from beta testers in a specific beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaGroups-_id_-relationships-builds>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBuildsForBetaGroupV1(id: String,
                                           requestBody: BetaGroupBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/betaGroups/\(id)/relationships/builds", method: .delete, requestBody: requestBody)
    }
}
