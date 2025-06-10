import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove Individual Testers from a Build
     Remove access to test a specific build from one or more individually assigned testers.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-builds-_id_-relationships-individualTesters>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteIndividualTestersForBuildV1(id: String,
                                                  requestBody: BuildIndividualTestersLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/individualTesters",
            method: .delete,
            requestBody: requestBody)
    }
}
