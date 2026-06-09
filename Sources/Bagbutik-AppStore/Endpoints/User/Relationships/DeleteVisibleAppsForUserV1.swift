import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove visible apps from a user
     Remove a user on your team’s access to one or more apps.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-users-_id_-relationships-visibleApps>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteVisibleAppsForUserV1(id: String,
                                           requestBody: UserVisibleAppsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/users/\(id)/relationships/visibleApps",
            method: .delete,
            requestBody: requestBody)
    }
}
