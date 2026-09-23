import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Get the beta app review submission ID for a build

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-relationships-betaAppReviewSubmission>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBetaAppReviewSubmissionIdsForBuildV1(id: String) -> Request<BuildBetaAppReviewSubmissionLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/betaAppReviewSubmission",
            method: .get)
    }
}
