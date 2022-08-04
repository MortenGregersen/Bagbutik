import Bagbutik_Core

public extension Request {
    /**
     # Individually Assign a Beta Tester to Builds
     Individually assign a beta tester to a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/individually_assign_a_beta_tester_to_builds>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBuildsForBetaTesterV1(id: String,
                                            requestBody: BetaTesterBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/betaTesters/\(id)/relationships/builds", method: .post, requestBody: requestBody)
    }
}
