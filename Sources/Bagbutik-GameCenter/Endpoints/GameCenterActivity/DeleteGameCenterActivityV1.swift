import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an activity
     Remove a specific Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterActivities-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterActivityV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)",
            method: .delete)
    }
}
