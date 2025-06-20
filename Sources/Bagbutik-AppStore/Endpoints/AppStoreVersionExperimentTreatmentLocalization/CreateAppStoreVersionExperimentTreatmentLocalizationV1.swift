import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/appStoreVersionExperimentTreatmentLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreVersionExperimentTreatmentLocalizations>

     - Parameter requestBody: AppStoreVersionExperimentTreatmentLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionExperimentTreatmentLocalizationV1(requestBody: AppStoreVersionExperimentTreatmentLocalizationCreateRequest) -> Request<AppStoreVersionExperimentTreatmentLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionExperimentTreatmentLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
