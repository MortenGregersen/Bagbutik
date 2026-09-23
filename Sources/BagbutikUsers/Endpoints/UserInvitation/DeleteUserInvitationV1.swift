import BagbutikCore
import BagbutikModelsShared
import BagbutikUsersModels

public extension Request {
    /**
     # Cancel a user invitation

     Cancel a pending invitation for a user to join your team.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-userInvitations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteUserInvitationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/userInvitations/\(id)",
            method: .delete)
    }
}
