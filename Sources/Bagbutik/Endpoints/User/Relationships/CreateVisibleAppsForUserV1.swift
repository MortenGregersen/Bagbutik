public extension Request {
    /**
     # Add Visible Apps to a User
     Give a user on your team access to one or more apps.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/add_visible_apps_to_a_user>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createVisibleAppsForUserV1(id: String,
                                           requestBody: UserVisibleAppsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/users/\(id)/relationships/visibleApps", method: .post, requestBody: requestBody)
    }
}
