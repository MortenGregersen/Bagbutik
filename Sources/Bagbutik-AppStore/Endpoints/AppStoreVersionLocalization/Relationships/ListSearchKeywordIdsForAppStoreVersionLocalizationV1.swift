import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List search keyword IDs for an app store version localization
     Get a list of search keyword IDs for a specific App Store version localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersionLocalizations-_id_-relationships-searchKeywords>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSearchKeywordIdsForAppStoreVersionLocalizationV1(id: String,
                                                                     limit: Int? = nil) -> Request<AppStoreVersionLocalizationSearchKeywordsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionLocalizations/\(id)/relationships/searchKeywords",
            method: .get,
            parameters: .init(limit: limit))
    }
}
