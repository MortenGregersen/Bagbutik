import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List app preview set Ids for a custom product page localization
     List the app preview set IDs for a specific custom product page localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCustomProductPageLocalizations-_id_-relationships-appPreviewSets>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppPreviewSetIdsForAppCustomProductPageLocalizationV1(id: String,
                                                                          limit: Int? = nil) -> Request<AppCustomProductPageLocalizationAppPreviewSetsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appCustomProductPageLocalizations/\(id)/relationships/appPreviewSets",
            method: .get,
            parameters: .init(limit: limit))
    }
}
