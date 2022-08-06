import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the Image for an Advanced App Clip Experience
     Update image information or commit the image asset of an advanced App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_image_for_an_advanced_app_clip_experience>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipAdvancedExperienceImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipAdvancedExperienceImageV1(id: String,
                                                       requestBody: AppClipAdvancedExperienceImageUpdateRequest) -> Request<AppClipAdvancedExperienceImageResponse, ErrorResponse>
    {
        .init(path: "/v1/appClipAdvancedExperienceImages/\(id)", method: .patch, requestBody: requestBody)
    }
}
