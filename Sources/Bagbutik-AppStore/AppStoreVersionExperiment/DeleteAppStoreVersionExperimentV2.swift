import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Store Version Experiment v1
     Delete a specific App Store version experiment before it starts.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appstoreversionexperiments_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppStoreVersionExperimentV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v2/appStoreVersionExperiments/\(id)", method: .delete)
    }
}
