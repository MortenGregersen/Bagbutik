import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an App Store experiment v1
     Add a new experiment to an App Store version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appstoreversionexperiments>

     - Parameter requestBody: AppStoreVersionExperiment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createAppStoreVersionExperimentV1(requestBody: AppStoreVersionExperimentCreateRequest) -> Request<AppStoreVersionExperimentResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersionExperiments", method: .post, requestBody: requestBody)
    }
}
