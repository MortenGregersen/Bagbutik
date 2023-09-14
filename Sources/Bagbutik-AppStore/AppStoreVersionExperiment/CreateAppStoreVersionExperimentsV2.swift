import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an App Store Experiment
     Add a new experiment to an App Store version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_store_experiment>

     - Parameter requestBody: AppStoreVersionExperiment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionExperimentsV2(requestBody: AppStoreVersionExperimentV2CreateRequest) -> Request<AppStoreVersionExperimentV2Response, ErrorResponse> {
        .init(path: "/v2/appStoreVersionExperiments", method: .post, requestBody: requestBody)
    }
}
