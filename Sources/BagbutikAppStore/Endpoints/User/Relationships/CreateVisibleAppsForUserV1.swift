import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared
import BagbutikUsersModels

public extension Request {
    /**
     # Add visible apps to a user

     Give a user on your team access to one or more apps.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-users-_id_-relationships-visibleApps>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createVisibleAppsForUserV1(id: String,
                                           requestBody: UserVisibleAppsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/users/\(id)/relationships/visibleApps",
            method: .post,
            requestBody: requestBody)
    }
}
