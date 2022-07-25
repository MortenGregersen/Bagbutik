public extension Request {
    /**
      # Modify a User Account
      Change a user's role, app visibility information, or other account details.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_user_account>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: User representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateUserV1(id: String,
                             requestBody: UserUpdateRequest) -> Request<UserResponse, ErrorResponse>
    {
        return .init(path: "/v1/users/\(id)", method: .patch, requestBody: requestBody)
    }
}
