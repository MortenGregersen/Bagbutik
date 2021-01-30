public extension Request {
    /**
      # Modify a User Account
      Change a user's role, app visibility information, or other account details.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_user_account>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateUser(id: String,
                           requestBody: UserUpdateRequest) -> Request<UserResponse, ErrorResponse>
    {
        return .init(path: "/v1/users/\(id)", method: .patch, requestBody: requestBody)
    }
}
