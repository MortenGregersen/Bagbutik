import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List item Ids
     Get the list of item IDs for a specific review submission.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-reviewSubmissions-_id_-relationships-items>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listItemIdsForReviewSubmissionV1(id: String,
                                                 limit: Int? = nil) -> Request<ReviewSubmissionItemsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/reviewSubmissions/\(id)/relationships/items",
            method: .get,
            parameters: .init(limit: limit))
    }
}
