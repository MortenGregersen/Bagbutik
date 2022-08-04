import Bagbutik_Core

public extension Request {
    /**
     # POST /v1/appStoreVersionExperiments

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appstoreversionexperiments>

     - Parameter requestBody: AppStoreVersionExperiment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionExperimentV1(requestBody: AppStoreVersionExperimentCreateRequest) -> Request<AppStoreVersionExperimentResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersionExperiments", method: .post, requestBody: requestBody)
    }
}
