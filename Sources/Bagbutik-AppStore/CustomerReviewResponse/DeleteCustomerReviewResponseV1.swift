import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Response to a Customer Review
     Delete a specific response you wrote to a customer review.

     Deletions of responses don’t take effect instantly in the App Store. Allow some time for the deletion to take effect.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_response_to_a_customer_review>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteCustomerReviewResponseV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/customerReviewResponses/\(id)", method: .delete)
    }
}
