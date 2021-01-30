public extension Request {
    /**
      # Invite a User
      Invite a user with assigned user roles to join your team.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/invite_a_user>

      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createUserInvitation(requestBody: UserInvitationCreateRequest) -> Request<UserInvitationResponse, ErrorResponse> {
        return .init(path: "/v1/userInvitations", method: .post, requestBody: requestBody)
    }
}
