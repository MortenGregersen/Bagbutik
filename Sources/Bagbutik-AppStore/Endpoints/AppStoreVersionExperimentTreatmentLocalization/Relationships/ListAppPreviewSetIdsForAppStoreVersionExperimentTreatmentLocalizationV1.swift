import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List preview set IDs for an App Store version experiment treatment localization

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersionExperimentTreatmentLocalizations-_id_-relationships-appPreviewSets>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listAppPreviewSetIdsForAppStoreVersionExperimentTreatmentLocalizationV1(id: String,
                                                                                        limit: Int? = nil) -> Request<AppStoreVersionExperimentTreatmentLocalizationAppPreviewSetsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionExperimentTreatmentLocalizations/\(id)/relationships/appPreviewSets",
            method: .get,
            parameters: .init(limit: limit))
    }
}
