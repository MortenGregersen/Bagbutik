import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Store Experiment
     Update the name, the started state, and the proportion of traffic to send to an App Store experiment.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_store_experiment>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreVersionExperiment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreVersionExperimentsV2(id: String,
                                                   requestBody: AppStoreVersionExperimentV2UpdateRequest) -> Request<AppStoreVersionExperimentV2Response, ErrorResponse>
    {
        .init(path: "/v2/appStoreVersionExperiments/\(id)", method: .patch, requestBody: requestBody)
    }
}
