import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Store experiment v1
     Update the name, the started state, and the proportion of traffic to send to an App Store experiment.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_appstoreversionexperiments_id>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreVersionExperiment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreVersionExperimentV2(id: String,
                                                  requestBody: AppStoreVersionExperimentV2UpdateRequest) -> Request<AppStoreVersionExperimentV2Response, ErrorResponse>
    {
        .init(path: "/v2/appStoreVersionExperiments/\(id)", method: .patch, requestBody: requestBody)
    }
}
