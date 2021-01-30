public extension Request {
    /**
      # Add Visible Apps to a User
      Give a user on your team access to one or more apps.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/add_visible_apps_to_a_user>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createVisibleAppsForUser(id: String,
                                         requestBody: UserVisibleAppsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/users/\(id)/relationships/visibleApps", method: .post, requestBody: requestBody)
    }
}
