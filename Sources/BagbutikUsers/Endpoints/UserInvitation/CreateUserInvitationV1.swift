import BagbutikCore
import BagbutikUsersModels

public extension Request {
    /**
     # Invite a user

     Invite a user with assigned user roles to join your team.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-userInvitations>

     - Parameter requestBody: UserInvitation representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createUserInvitationV1(requestBody: UserInvitationCreateRequest) -> Request<UserInvitationResponse, ErrorResponse> {
        .init(
            path: "/v1/userInvitations",
            method: .post,
            requestBody: requestBody)
    }
}
