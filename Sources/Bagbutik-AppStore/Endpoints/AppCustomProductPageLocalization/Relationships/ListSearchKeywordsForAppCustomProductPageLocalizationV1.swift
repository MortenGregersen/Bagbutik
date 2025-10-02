import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List app preview sets for a custom product page localization
     List the app preview sets for a specific custom product page localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCustomProductPageLocalizations-_id_-searchKeywords>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSearchKeywordsForAppCustomProductPageLocalizationV1(id: String,
                                                                        filters: [ListSearchKeywordsForAppCustomProductPageLocalizationV1.Filter]? = nil,
                                                                        limit: Int? = nil) -> Request<AppKeywordsResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageLocalizations/\(id)/searchKeywords",
            method: .get,
            parameters: .init(
                filters: filters,
                limit: limit))
    }
}

public enum ListSearchKeywordsForAppCustomProductPageLocalizationV1 {
    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by locale
        case locale([String])
        /// Filter by platform
        case platform([String])
    }
}
