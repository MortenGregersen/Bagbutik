import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Store version experiement treatment
     Update the name and app icon name for a specific App Store version experiment.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appStoreVersionExperimentTreatments-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreVersionExperimentTreatment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreVersionExperimentTreatmentV1(id: String,
                                                           requestBody: AppStoreVersionExperimentTreatmentUpdateRequest) -> Request<AppStoreVersionExperimentTreatmentResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersionExperimentTreatments/\(id)", method: .patch, requestBody: requestBody)
    }
}
