import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Store Review Detail
     Update the app store review details, including the contact information, demo account, and notes.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appStoreReviewDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreReviewDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreReviewDetailV1(id: String,
                                             requestBody: AppStoreReviewDetailUpdateRequest) -> Request<AppStoreReviewDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreReviewDetails/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
