import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an app clip card image for an advanced app clip experience
     Reserve an image asset that appears on the App Clip card of an advanced App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appClipAdvancedExperienceImages>

     - Parameter requestBody: AppClipAdvancedExperienceImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppClipAdvancedExperienceImageV1(requestBody: AppClipAdvancedExperienceImageCreateRequest) -> Request<AppClipAdvancedExperienceImageResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipAdvancedExperienceImages",
            method: .post,
            requestBody: requestBody)
    }
}
