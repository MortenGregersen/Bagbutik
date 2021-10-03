public extension Request {
    /**
      # Manually Release an App Store Approved Version of Your App
      Release an approved version of your app to the App Store.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/manually_release_an_app_store_approved_version_of_your_app?changes=latest_minor>

      - Parameter requestBody: AppStoreVersionReleaseRequest representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreVersionReleaseRequest(requestBody: AppStoreVersionReleaseRequestCreateRequest) -> Request<AppStoreVersionReleaseRequestResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionReleaseRequests", method: .post, requestBody: requestBody)
    }
}
