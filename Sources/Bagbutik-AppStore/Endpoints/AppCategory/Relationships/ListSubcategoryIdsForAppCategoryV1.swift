import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appCategories/{id}/relationships/subcategories

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appCategories-_id_-relationships-subcategories>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSubcategoryIdsForAppCategoryV1(id: String,
                                                   limit: Int? = nil) -> Request<AppCategorySubcategoriesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appCategories/\(id)/relationships/subcategories",
            method: .get,
            parameters: .init(limit: limit))
    }
}
