import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get All IDs of Builds Individually Assigned to a Beta Tester
     Get a list of build resource IDs individually assigned to a specific beta tester.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaTesters-_id_-relationships-builds>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildIdsForBetaTesterV1(id: String,
                                            limit: Int? = nil) -> Request<BetaTesterBuildsLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/betaTesters/\(id)/relationships/builds", method: .get, parameters: .init(limit: limit))
    }
}
