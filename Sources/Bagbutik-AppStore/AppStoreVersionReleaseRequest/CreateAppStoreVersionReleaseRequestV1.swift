import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Manually Release an App Store Approved Version of Your App
     Release an approved version of your app to the App Store.

     When you submit your app for review, if itʼs approved and the status changes to Pending Developer Release, then you can release a version. For more information about app review, see [Submit for review](https://developer.apple.com/help/app-store-connect/manage-submissions-to-app-review/submit-for-review). For more information about manually releasing versions, see [Select a version release option](https://devcms.apple.com/help/app-store-connect/manage-your-apps-availability/select-a-version-release-option). For more information about app status, see [App and submission statuses](https://developer.apple.com/help/app-store-connect/reference/app-and-submission-statuses).

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/manually_release_an_app_store_approved_version_of_your_app>

     - Parameter requestBody: AppStoreVersionReleaseRequest representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionReleaseRequestV1(requestBody: AppStoreVersionReleaseRequestCreateRequest) -> Request<AppStoreVersionReleaseRequestResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersionReleaseRequests", method: .post, requestBody: requestBody)
    }
}
