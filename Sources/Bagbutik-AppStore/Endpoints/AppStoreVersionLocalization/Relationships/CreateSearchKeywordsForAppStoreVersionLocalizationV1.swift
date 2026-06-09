import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add search keywords to an app store version localization
     Add search keywords to a specific App Store version localization.

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
