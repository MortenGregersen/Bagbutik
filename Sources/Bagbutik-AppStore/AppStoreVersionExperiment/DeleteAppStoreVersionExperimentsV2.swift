import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Store Experiment
     Delete a specific App Store version experiment before it starts.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_store_experiment>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppStoreVersionExperimentsV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v2/appStoreVersionExperiments/\(id)", method: .delete)
    }
}
