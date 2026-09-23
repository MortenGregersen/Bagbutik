import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Submit an app for beta review

     Submit an app for beta app review to allow external testing.

     ## Overview> Important:
     > Before submitting to beta app review, you need to add a description for all `betaAppLocalizations`. To add a description, use ``doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/PATCH-v1-betaAppLocalizations-_id_``.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaAppReviewSubmissions>

     - Parameter requestBody: BetaAppReviewSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaAppReviewSubmissionV1(requestBody: BetaAppReviewSubmissionCreateRequest) -> Request<BetaAppReviewSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppReviewSubmissions",
            method: .post,
            requestBody: requestBody)
    }
}
