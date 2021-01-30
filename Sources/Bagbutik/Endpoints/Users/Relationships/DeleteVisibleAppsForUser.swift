public extension Request {
    /**
      # Remove Visible Apps from a User
      Remove a user on your team’s access to one or more apps.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/remove_visible_apps_from_a_user>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteVisibleAppsForUser(id: String,
                                         requestBody: UserVisibleAppsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/users/\(id)/relationships/visibleApps", method: .delete, requestBody: requestBody)
    }
}
