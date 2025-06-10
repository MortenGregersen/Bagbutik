import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the Image for an Advanced App Clip Experience
     Update image information or commit the image asset of an advanced App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appClipAdvancedExperienceImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipAdvancedExperienceImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipAdvancedExperienceImageV1(id: String,
                                                       requestBody: AppClipAdvancedExperienceImageUpdateRequest) -> Request<AppClipAdvancedExperienceImageResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipAdvancedExperienceImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
