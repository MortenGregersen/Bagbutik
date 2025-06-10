import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appClipDefaultExperiences/{id}/relationships/appClipAppStoreReviewDetail

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appClipDefaultExperiences-_id_-relationships-appClipAppStoreReviewDetail>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipAppStoreReviewDetailIdsForAppClipDefaultExperienceV1(id: String) -> Request<AppClipDefaultExperienceAppClipAppStoreReviewDetailLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipDefaultExperiences/\(id)/relationships/appClipAppStoreReviewDetail",
            method: .get)
    }
}
