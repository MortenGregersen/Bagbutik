import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify and delete an advanced app clip experience

     Update and delete an existing advanced App Clip experience.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appClipAdvancedExperiences-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipAdvancedExperience representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipAdvancedExperienceV1(id: String,
                                                  requestBody: AppClipAdvancedExperienceUpdateRequest) -> Request<AppClipAdvancedExperienceResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipAdvancedExperiences/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
