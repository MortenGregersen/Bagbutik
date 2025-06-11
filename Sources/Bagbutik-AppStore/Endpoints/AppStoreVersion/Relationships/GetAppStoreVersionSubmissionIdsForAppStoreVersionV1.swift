import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersions/{id}/relationships/appStoreVersionSubmission

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-relationships-appStoreVersionSubmission>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getAppStoreVersionSubmissionIdsForAppStoreVersionV1(id: String) -> Request<AppStoreVersionAppStoreVersionSubmissionLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/relationships/appStoreVersionSubmission",
            method: .get)
    }
}
