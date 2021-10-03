public extension Request {
    /**
      # Get All Visible App Resource IDs for a User
      Get a list of app resource IDs to which a user on your team has access.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_all_visible_app_resource_ids_for_a_user>

      - Parameter id: The id of the requested resource
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listVisibleAppIdsForUser(id: String,
                                         limit: Int? = nil) -> Request<UserVisibleAppsLinkagesResponse, ErrorResponse>
    {
        return .init(path: "/v1/users/\(id)/relationships/visibleApps", method: .get, parameters: .init(limit: limit))
    }
}
