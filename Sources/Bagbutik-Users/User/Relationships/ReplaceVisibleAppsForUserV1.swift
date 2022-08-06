import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Replace the List of Visible Apps for a User
     Replace the list of apps a user on your team can see.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/replace_the_list_of_visible_apps_for_a_user>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceVisibleAppsForUserV1(id: String,
                                            requestBody: UserVisibleAppsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/users/\(id)/relationships/visibleApps", method: .patch, requestBody: requestBody)
    }
}
