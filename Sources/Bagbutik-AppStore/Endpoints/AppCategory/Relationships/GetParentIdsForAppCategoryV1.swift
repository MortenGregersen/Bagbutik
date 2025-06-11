import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appCategories/{id}/relationships/parent

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCategories-_id_-relationships-parent>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getParentIdsForAppCategoryV1(id: String) -> Request<AppCategoryParentLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appCategories/\(id)/relationships/parent",
            method: .get)
    }
}
