import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Individually assign a beta tester to builds
     Individually assign a beta tester to a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaTesters-_id_-relationships-builds>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBuildsForBetaTesterV1(id: String,
                                            requestBody: BetaTesterBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/betaTesters/\(id)/relationships/builds",
            method: .post,
            requestBody: requestBody)
    }
}
