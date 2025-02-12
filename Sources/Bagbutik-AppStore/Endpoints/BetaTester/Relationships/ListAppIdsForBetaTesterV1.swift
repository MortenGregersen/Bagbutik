import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get All App Resource IDs for a Beta Tester
     Get a list of app resource IDs associated with a beta tester.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaTesters-_id_-relationships-apps>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppIdsForBetaTesterV1(id: String,
                                          limit: Int? = nil) -> Request<BetaTesterAppsLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/betaTesters/\(id)/relationships/apps", method: .get, parameters: .init(limit: limit))
    }
}
