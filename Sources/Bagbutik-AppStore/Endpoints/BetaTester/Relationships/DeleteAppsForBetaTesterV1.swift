import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove a Beta Tester’s Access to Apps
     Remove a specific beta tester’s access to test any builds of one or more apps.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaTesters-_id_-relationships-apps>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppsForBetaTesterV1(id: String,
                                          requestBody: BetaTesterAppsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/betaTesters/\(id)/relationships/apps",
            method: .delete,
            requestBody: requestBody)
    }
}
