public extension Request {
    /**
     # PATCH /v1/appStoreVersionExperimentTreatments/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_appstoreversionexperimenttreatments_id>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreVersionExperimentTreatment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreVersionExperimentTreatmentV1(id: String,
                                                           requestBody: AppStoreVersionExperimentTreatmentUpdateRequest) -> Request<AppStoreVersionExperimentTreatmentResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersionExperimentTreatments/\(id)", method: .patch, requestBody: requestBody)
    }
}
