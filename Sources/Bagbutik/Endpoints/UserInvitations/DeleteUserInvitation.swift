public extension Request {
    /**
      # Cancel a User Invitation
      Cancel a pending invitation for a user to join your team.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/cancel_a_user_invitation>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteUserInvitation(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/userInvitations/\(id)", method: .delete)
    }
}
