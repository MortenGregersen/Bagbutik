public extension Request {
    /**
     # Delete an App Store Version Experiment
     Delete a specific App Store Version Experiment before it’s started.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appstoreversionexperiments_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppStoreVersionExperimentV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersionExperiments/\(id)", method: .delete)
    }
}
