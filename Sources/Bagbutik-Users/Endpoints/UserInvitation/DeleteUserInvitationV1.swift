public extension Request {
    /**
     # Cancel a User Invitation
     Cancel a pending invitation for a user to join your team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cancel_a_user_invitation>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteUserInvitationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/userInvitations/\(id)", method: .delete)
    }
}
