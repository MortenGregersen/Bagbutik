import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Modify a beta app review detail

     Update the details for a specific app’s beta app review.

     ## Overview> Important:
     > First name, last name, phone, email cannot be cleared for the primary locale once set.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-betaAppReviewDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BetaAppReviewDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBetaAppReviewDetailV1(id: String,
                                            requestBody: BetaAppReviewDetailUpdateRequest) -> Request<BetaAppReviewDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppReviewDetails/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
