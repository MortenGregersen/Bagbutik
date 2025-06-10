import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an App Store Version Submission
     Submit an App Store version to App Review.

     Use this endpoint to submit a version to the App Store. If the version is missing required information, this request fails and the response contains error messages that indicate the problems.
     If the version’s `releaseType` attribute is `AFTER_APPROVAL`, after App Review approves the version App Store Connect  automatically releases it to the App Store.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreVersionSubmissions>

     - Parameter requestBody: AppStoreVersionSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createAppStoreVersionSubmissionV1(requestBody: AppStoreVersionSubmissionCreateRequest) -> Request<AppStoreVersionSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionSubmissions",
            method: .post,
            requestBody: requestBody)
    }
}
