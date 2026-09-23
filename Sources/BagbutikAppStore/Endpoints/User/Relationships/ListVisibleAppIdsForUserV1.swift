import BagbutikCore
import BagbutikAppStoreModels
import BagbutikUsersModels

public extension Request {
    /**
     # Get all visible app resource ids for a user

     Get a list of app resource IDs to which a user on your team has access.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-users-_id_-relationships-visibleApps>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVisibleAppIdsForUserV1(id: String,
                                           limit: Int? = nil) -> Request<UserVisibleAppsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/users/\(id)/relationships/visibleApps",
            method: .get,
            parameters: .init(limit: limit))
    }
}
