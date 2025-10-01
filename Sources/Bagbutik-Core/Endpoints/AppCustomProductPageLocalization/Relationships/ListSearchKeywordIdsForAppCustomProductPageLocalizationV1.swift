import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all search keywords for a customer product page localization
     Get a list of search keyword IDs for a customer product page localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCustomProductPageLocalizations-_id_-relationships-searchKeywords>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSearchKeywordIdsForAppCustomProductPageLocalizationV1(id: String,
                                                                          limit: Int? = nil) -> Request<AppCustomProductPageLocalizationSearchKeywordsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageLocalizations/\(id)/relationships/searchKeywords",
            method: .get,
            parameters: .init(limit: limit))
    }
}
