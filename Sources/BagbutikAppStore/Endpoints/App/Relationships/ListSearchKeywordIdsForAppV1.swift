import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List search keyword IDs for an app

     Get a list of search keyword IDs for a specific app.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-searchKeywords>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSearchKeywordIdsForAppV1(id: String,
                                             limit: Int? = nil) -> Request<AppSearchKeywordsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/searchKeywords",
            method: .get,
            parameters: .init(limit: limit))
    }
}
