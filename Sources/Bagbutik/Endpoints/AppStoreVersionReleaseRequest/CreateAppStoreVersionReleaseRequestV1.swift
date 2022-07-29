public extension Request {
    /**
     # Manually Release an App Store Approved Version of Your App
     Release an approved version of your app to the App Store.

     When you submit your app for review, if itʼs approved and the status changes to Pending Developer Release, then you can release a version. For more information about app review, see [Submit Your App for Review](https://help.apple.com/app-store-connect/#/dev301cb2b3e). For more information about manually releasing versions, see [Manually Release a Version](https://help.apple.com/app-store-connect/#/devabbb787a6). For more information about app status, see [App Statuses](https://help.apple.com/app-store-connect/#/dev18557d60e).

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/manually_release_an_app_store_approved_version_of_your_app>

     - Parameter requestBody: AppStoreVersionReleaseRequest representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionReleaseRequestV1(requestBody: AppStoreVersionReleaseRequestCreateRequest) -> Request<AppStoreVersionReleaseRequestResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersionReleaseRequests", method: .post, requestBody: requestBody)
    }
}
