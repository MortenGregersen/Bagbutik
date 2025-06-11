import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/customerReviews/{id}/relationships/response

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-customerReviews-_id_-relationships-response>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getResponseIdsForCustomerReviewV1(id: String) -> Request<CustomerReviewResponseLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/customerReviews/\(id)/relationships/response",
            method: .get)
    }
}
