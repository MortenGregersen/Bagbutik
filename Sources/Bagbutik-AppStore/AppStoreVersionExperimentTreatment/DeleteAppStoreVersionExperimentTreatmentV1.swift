import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Treatment for an App Store Version Experiment
     Delete metadata that you configured for an App Store Version experiment.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appstoreversionexperimenttreatments_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppStoreVersionExperimentTreatmentV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersionExperimentTreatments/\(id)", method: .delete)
    }
}
