import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify the image for an advanced app clip experience

     Update image information or commit the image asset of an advanced App Clip experience.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
