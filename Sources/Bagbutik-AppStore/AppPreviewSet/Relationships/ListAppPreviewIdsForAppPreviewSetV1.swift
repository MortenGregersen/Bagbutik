import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get All App Preview IDs for an App Preview Set
     Get the ordered app preview IDs in a preview set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_all_app_preview_ids_for_an_app_preview_set>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppPreviewIdsForAppPreviewSetV1(id: String,
                                                    limit: Int? = nil) -> Request<AppPreviewSetAppPreviewsLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/appPreviewSets/\(id)/relationships/appPreviews", method: .get, parameters: .init(limit: limit))
    }
}
