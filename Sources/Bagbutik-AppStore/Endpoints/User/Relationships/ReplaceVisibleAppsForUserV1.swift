import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Replace the List of Visible Apps for a User
     Replace the list of apps a user on your team can see.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-users-_id_-relationships-visibleApps>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceVisibleAppsForUserV1(id: String,
                                            requestBody: UserVisibleAppsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/users/\(id)/relationships/visibleApps",
            method: .patch,
            requestBody: requestBody)
    }
}
