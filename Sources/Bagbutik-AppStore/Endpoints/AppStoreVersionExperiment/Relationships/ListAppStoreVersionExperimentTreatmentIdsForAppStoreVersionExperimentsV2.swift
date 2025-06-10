import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v2/appStoreVersionExperiments/{id}/relationships/appStoreVersionExperimentTreatments

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-appStoreVersionExperiments-_id_-relationships-appStoreVersionExperimentTreatments>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppStoreVersionExperimentTreatmentIdsForAppStoreVersionExperimentsV2(id: String,
                                                                                         limit: Int? = nil) -> Request<AppStoreVersionExperimentV2AppStoreVersionExperimentTreatmentsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/appStoreVersionExperiments/\(id)/relationships/appStoreVersionExperimentTreatments",
            method: .get,
            parameters: .init(limit: limit))
    }
}
