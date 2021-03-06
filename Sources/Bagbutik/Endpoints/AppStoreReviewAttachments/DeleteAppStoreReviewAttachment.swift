public extension Request {
    /**
      # Delete an App Store Review Attachment
      Remove an attachment before you send your app to App Review.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_store_review_attachment>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteAppStoreReviewAttachment(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreReviewAttachments/\(id)", method: .delete)
    }
}
