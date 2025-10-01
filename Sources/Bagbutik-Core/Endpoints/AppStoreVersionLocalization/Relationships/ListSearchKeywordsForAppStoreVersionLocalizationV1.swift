import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersionLocalizations/{id}/searchKeywords

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersionLocalizations-_id_-searchKeywords>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSearchKeywordsForAppStoreVersionLocalizationV1(id: String,
                                                                   filters: [ListSearchKeywordsForAppStoreVersionLocalizationV1.Filter]? = nil,
                                                                   limit: Int? = nil) -> Request<AppKeywordsResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionLocalizations/\(id)/searchKeywords",
            method: .get,
            parameters: .init(
                filters: filters,
                limit: limit))
    }
}

public enum ListSearchKeywordsForAppStoreVersionLocalizationV1 {
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
