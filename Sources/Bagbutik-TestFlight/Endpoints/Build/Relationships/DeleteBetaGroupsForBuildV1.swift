import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove Access for Beta Groups to a Build
     Remove access to a specific build for all beta testers in one or more beta groups.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-builds-_id_-relationships-betaGroups>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaGroupsForBuildV1(id: String,
                                           requestBody: BuildBetaGroupsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/betaGroups",
            method: .delete,
            requestBody: requestBody)
    }
}
