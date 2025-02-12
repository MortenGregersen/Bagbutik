import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add Access for Beta Groups to a Build
     Add or create a beta group to a build to enable testing.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-builds-_id_-relationships-betaGroups>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaGroupsForBuildV1(id: String,
                                           requestBody: BuildBetaGroupsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/builds/\(id)/relationships/betaGroups", method: .post, requestBody: requestBody)
    }
}
