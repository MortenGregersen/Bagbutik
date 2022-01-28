public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_appstoreversionexperimenttreatments_id>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppStoreVersionExperimentTreatment representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppStoreVersionExperimentTreatment(id: String,
                                                         requestBody: AppStoreVersionExperimentTreatmentUpdateRequest) -> Request<AppStoreVersionExperimentTreatmentResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersionExperimentTreatments/\(id)", method: .patch, requestBody: requestBody)
    }
}
