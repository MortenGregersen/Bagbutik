import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a default app clip experience

     Update a default App Clip experience.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appClipDefaultExperiences-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipDefaultExperience representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipDefaultExperienceV1(id: String,
                                                 requestBody: AppClipDefaultExperienceUpdateRequest) -> Request<AppClipDefaultExperienceResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipDefaultExperiences/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
