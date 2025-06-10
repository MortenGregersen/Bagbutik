import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add Builds to a Beta Group
     Associate builds with a beta group to enable the group to test the builds.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaGroups-_id_-relationships-builds>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBuildsForBetaGroupV1(id: String,
                                           requestBody: BetaGroupBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups/\(id)/relationships/builds",
            method: .post,
            requestBody: requestBody)
    }
}
