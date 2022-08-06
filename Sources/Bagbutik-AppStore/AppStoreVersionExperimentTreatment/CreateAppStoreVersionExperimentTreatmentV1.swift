import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/appStoreVersionExperimentTreatments

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appstoreversionexperimenttreatments>

     - Parameter requestBody: AppStoreVersionExperimentTreatment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionExperimentTreatmentV1(requestBody: AppStoreVersionExperimentTreatmentCreateRequest) -> Request<AppStoreVersionExperimentTreatmentResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersionExperimentTreatments", method: .post, requestBody: requestBody)
    }
}
