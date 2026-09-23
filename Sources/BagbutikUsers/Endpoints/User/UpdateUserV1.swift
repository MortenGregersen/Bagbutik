import BagbutikCore
import BagbutikUsersModels

public extension Request {
    /**
     # Modify a user account

     Change a user’s role, app visibility information, or other account details.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-users-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: User representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateUserV1(id: String,
                             requestBody: UserUpdateRequest) -> Request<UserResponse, ErrorResponse> {
        .init(
            path: "/v1/users/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
