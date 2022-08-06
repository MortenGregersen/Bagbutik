import Bagbutik_Models

public extension Request {
    /**
     # Remove Visible Apps from a User
     Remove a user on your team’s access to one or more apps.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/remove_visible_apps_from_a_user>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteVisibleAppsForUserV1(id: String,
                                           requestBody: UserVisibleAppsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/users/\(id)/relationships/visibleApps", method: .delete, requestBody: requestBody)
    }
}
