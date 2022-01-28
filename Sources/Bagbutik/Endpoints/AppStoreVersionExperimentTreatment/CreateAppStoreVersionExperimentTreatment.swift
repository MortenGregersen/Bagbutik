public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appstoreversionexperimenttreatments>

      - Parameter requestBody: AppStoreVersionExperimentTreatment representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreVersionExperimentTreatment(requestBody: AppStoreVersionExperimentTreatmentCreateRequest) -> Request<AppStoreVersionExperimentTreatmentResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionExperimentTreatments", method: .post, requestBody: requestBody)
    }
}
