import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Individually Unassign a Beta Tester from Builds
     Remove an individually assigned beta tester’s ability to test a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaTesters-_id_-relationships-builds>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBuildsForBetaTesterV1(id: String,
                                            requestBody: BetaTesterBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/betaTesters/\(id)/relationships/builds", method: .delete, requestBody: requestBody)
    }
}
