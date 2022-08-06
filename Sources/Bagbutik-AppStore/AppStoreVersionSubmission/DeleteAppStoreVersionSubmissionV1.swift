import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Store Version Submission
     Remove a version from App Store review.

     Use this endpoint to remove a version from App Review. This request fails with an appropriate error if the app can't be removed from review. For more information, see [Remove a version from review](https://help.apple.com/app-store-connect/#/dev04f55d711).

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_store_version_submission>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func deleteAppStoreVersionSubmissionV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersionSubmissions/\(id)", method: .delete)
    }
}
