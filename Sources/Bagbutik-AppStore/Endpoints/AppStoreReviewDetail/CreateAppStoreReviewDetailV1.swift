import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an App Store Review Detail
     Add App Store review details to an App Store version, including contact and demo account information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreReviewDetails>

     - Parameter requestBody: AppStoreReviewDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreReviewDetailV1(requestBody: AppStoreReviewDetailCreateRequest) -> Request<AppStoreReviewDetailResponse, ErrorResponse> {
        .init(path: "/v1/appStoreReviewDetails", method: .post, requestBody: requestBody)
    }
}
