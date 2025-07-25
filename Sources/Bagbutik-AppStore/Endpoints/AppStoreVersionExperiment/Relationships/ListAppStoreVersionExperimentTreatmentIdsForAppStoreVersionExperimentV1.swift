import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersionExperiments/{id}/relationships/appStoreVersionExperimentTreatments

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersionExperiments-_id_-relationships-appStoreVersionExperimentTreatments>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listAppStoreVersionExperimentTreatmentIdsForAppStoreVersionExperimentV1(id: String,
                                                                                        limit: Int? = nil) -> Request<AppStoreVersionExperimentAppStoreVersionExperimentTreatmentsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionExperiments/\(id)/relationships/appStoreVersionExperimentTreatments",
            method: .get,
            parameters: .init(limit: limit))
    }
}
