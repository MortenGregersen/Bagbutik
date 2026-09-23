import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete a response to a customer review

     Delete a specific response you wrote to a customer review.

     ## Discussion

     Deletions of responses don’t take effect instantly in the App Store. Allow some time for the deletion to take effect.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-customerReviewResponses-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteCustomerReviewResponseV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/customerReviewResponses/\(id)",
            method: .delete)
    }
}
