public extension Request {
    /**
     # Delete a Treatment Localization for an App Store Version Experiment
     Delete localized metatdata that you configured for an App Store Version experiment treatment.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appstoreversionexperimenttreatmentlocalizations_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppStoreVersionExperimentTreatmentLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersionExperimentTreatmentLocalizations/\(id)", method: .delete)
    }
}
