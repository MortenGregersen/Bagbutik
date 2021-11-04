public extension Request {
    /**
      # Create an App Clip Card Image for a Default App Clip Experience
      Reserve an image asset that appears on the App Clip card of a default App Clip experience.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_clip_card_image_for_a_default_app_clip_experience>

      - Parameter requestBody: AppClipHeaderImage representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppClipHeaderImage(requestBody: AppClipHeaderImageCreateRequest) -> Request<AppClipHeaderImageResponse, ErrorResponse> {
        return .init(path: "/v1/appClipHeaderImages", method: .post, requestBody: requestBody)
    }
}
