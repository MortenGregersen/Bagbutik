import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/userInvitations/{id}/relationships/visibleApps

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-userInvitations-_id_-relationships-visibleApps>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVisibleAppIdsForUserInvitationV1(id: String,
                                                     limit: Int? = nil) -> Request<UserInvitationVisibleAppsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/userInvitations/\(id)/relationships/visibleApps",
            method: .get,
            parameters: .init(limit: limit))
    }
}
