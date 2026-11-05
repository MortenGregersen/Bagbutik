import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List retention message IDs for an app

     Get a list of retention message IDs for a specific app.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-retentionMessages>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listRetentionMessageIdsForAppV1(id: String,
                                                limit: Int? = nil) -> Request<AppRetentionMessagesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/retentionMessages",
            method: .get,
            parameters: .init(limit: limit))
    }
}
