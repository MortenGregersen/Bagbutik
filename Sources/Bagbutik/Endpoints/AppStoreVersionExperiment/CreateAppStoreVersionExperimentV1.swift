public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appstoreversionexperiments>

      - Parameter requestBody: AppStoreVersionExperiment representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreVersionExperimentV1(requestBody: AppStoreVersionExperimentCreateRequest) -> Request<AppStoreVersionExperimentResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionExperiments", method: .post, requestBody: requestBody)
    }
}
