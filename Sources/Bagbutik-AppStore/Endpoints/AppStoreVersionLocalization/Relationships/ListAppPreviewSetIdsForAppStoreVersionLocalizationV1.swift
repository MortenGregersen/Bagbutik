import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersionLocalizations/{id}/relationships/appPreviewSets

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersionLocalizations-_id_-relationships-appPreviewSets>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppPreviewSetIdsForAppStoreVersionLocalizationV1(id: String,
                                                                     limit: Int? = nil) -> Request<AppStoreVersionLocalizationAppPreviewSetsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionLocalizations/\(id)/relationships/appPreviewSets",
            method: .get,
            parameters: .init(limit: limit))
    }
}
