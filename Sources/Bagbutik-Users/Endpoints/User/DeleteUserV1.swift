import Bagbutik_Core

public extension Request {
    /**
     # Remove a User Account
     Remove a user from your team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/remove_a_user_account>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteUserV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/users/\(id)", method: .delete)
    }
}
