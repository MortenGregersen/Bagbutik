import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a search keyword to a custom product page localization
     Assign one or more search keywords to a specific custom product page localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appCustomProductPageLocalizations-_id_-relationships-searchKeywords>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSearchKeywordsForAppCustomProductPageLocalizationV1(id: String,
                                                                          requestBody: AppCustomProductPageLocalizationSearchKeywordsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageLocalizations/\(id)/relationships/searchKeywords",
            method: .post,
            requestBody: requestBody)
    }
}
