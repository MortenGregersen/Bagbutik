public extension Request {
    /**
      # Invite a User
      Invite a user with assigned user roles to join your team.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/invite_a_user>

      - Parameter requestBody: UserInvitation representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createUserInvitationV1(requestBody: UserInvitationCreateRequest) -> Request<UserInvitationResponse, ErrorResponse> {
        return .init(path: "/v1/userInvitations", method: .post, requestBody: requestBody)
    }
}
