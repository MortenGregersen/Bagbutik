import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Add a Search Keyword to a Custom Product Page Localization

     Assign one or more search keywords to a specific custom product page localization.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
