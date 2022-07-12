public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appstoreversionexperimenttreatmentlocalizations>

      - Parameter requestBody: AppStoreVersionExperimentTreatmentLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreVersionExperimentTreatmentLocalizationV1(requestBody: AppStoreVersionExperimentTreatmentLocalizationCreateRequest) -> Request<AppStoreVersionExperimentTreatmentLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionExperimentTreatmentLocalizations", method: .post, requestBody: requestBody)
    }
}
