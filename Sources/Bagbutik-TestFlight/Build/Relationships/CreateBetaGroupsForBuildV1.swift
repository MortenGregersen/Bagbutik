import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add Access for Beta Groups to a Build
     Add or create a beta group to a build to enable testing.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/add_access_for_beta_groups_to_a_build>

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
