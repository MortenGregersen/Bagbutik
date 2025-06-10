import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Store experiment v1
     Update the name, the started state, and the proportion of traffic to send to an App Store experiment.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appStoreVersionExperiments-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreVersionExperiment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateAppStoreVersionExperimentV1(id: String,
                                                  requestBody: AppStoreVersionExperimentUpdateRequest) -> Request<AppStoreVersionExperimentResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionExperiments/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
