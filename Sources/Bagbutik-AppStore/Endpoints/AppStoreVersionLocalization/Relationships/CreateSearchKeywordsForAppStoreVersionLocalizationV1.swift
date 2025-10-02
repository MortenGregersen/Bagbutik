import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/appStoreVersionLocalizations/{id}/relationships/searchKeywords

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreVersionLocalizations-_id_-relationships-searchKeywords>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSearchKeywordsForAppStoreVersionLocalizationV1(id: String,
                                                                     requestBody: AppStoreVersionLocalizationSearchKeywordsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionLocalizations/\(id)/relationships/searchKeywords",
            method: .post,
            requestBody: requestBody)
    }
}
