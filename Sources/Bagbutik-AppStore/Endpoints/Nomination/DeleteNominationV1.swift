import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a featuring nomination
     Remove a specific featuring nomination.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-nominations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteNominationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/nominations/\(id)", method: .delete)
    }
}
