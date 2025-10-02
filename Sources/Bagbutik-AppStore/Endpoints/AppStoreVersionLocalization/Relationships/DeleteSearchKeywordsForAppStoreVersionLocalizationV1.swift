import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # DELETE /v1/appStoreVersionLocalizations/{id}/relationships/searchKeywords

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appStoreVersionLocalizations-_id_-relationships-searchKeywords>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSearchKeywordsForAppStoreVersionLocalizationV1(id: String,
                                                                     requestBody: AppStoreVersionLocalizationSearchKeywordsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionLocalizations/\(id)/relationships/searchKeywords",
            method: .delete,
            requestBody: requestBody)
    }
}
