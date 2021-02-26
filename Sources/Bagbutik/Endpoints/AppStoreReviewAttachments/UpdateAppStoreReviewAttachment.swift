public extension Request {
    /**
      # Commit an App Store Review Attachment
      Commit an app screenshot after uploading it to the App Store.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/commit_an_app_store_review_attachment>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppStoreReviewAttachment representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppStoreReviewAttachment(id: String,
                                               requestBody: AppStoreReviewAttachmentUpdateRequest) -> Request<AppStoreReviewAttachmentResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreReviewAttachments/\(id)", method: .patch, requestBody: requestBody)
    }
}
