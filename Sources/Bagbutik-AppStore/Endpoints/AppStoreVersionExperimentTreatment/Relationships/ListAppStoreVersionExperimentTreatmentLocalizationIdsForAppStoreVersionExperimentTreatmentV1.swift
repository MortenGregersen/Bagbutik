import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersionExperimentTreatments/{id}/relationships/appStoreVersionExperimentTreatmentLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersionExperimentTreatments-_id_-relationships-appStoreVersionExperimentTreatmentLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppStoreVersionExperimentTreatmentLocalizationIdsForAppStoreVersionExperimentTreatmentV1(id: String,
                                                                                                             limit: Int? = nil) -> Request<AppStoreVersionExperimentTreatmentAppStoreVersionExperimentTreatmentLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionExperimentTreatments/\(id)/relationships/appStoreVersionExperimentTreatmentLocalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
