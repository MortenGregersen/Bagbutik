public extension Request {
    /**
      # Remove a User Account
      Remove a user from your team.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/remove_a_user_account>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteUser(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/users/\(id)", method: .delete)
    }
}
