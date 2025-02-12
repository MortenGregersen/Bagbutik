import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an App Clip Card Image for a Default App Clip Experience
     Reserve an image asset that appears on the App Clip card of a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appClipHeaderImages>

     - Parameter requestBody: AppClipHeaderImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppClipHeaderImageV1(requestBody: AppClipHeaderImageCreateRequest) -> Request<AppClipHeaderImageResponse, ErrorResponse> {
        .init(path: "/v1/appClipHeaderImages", method: .post, requestBody: requestBody)
    }
}
