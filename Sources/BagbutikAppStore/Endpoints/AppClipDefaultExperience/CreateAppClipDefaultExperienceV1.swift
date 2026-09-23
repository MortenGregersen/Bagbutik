import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a default app clip experience

     Configure a new default App Clip experience.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appClipDefaultExperiences>

     - Parameter requestBody: AppClipDefaultExperience representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppClipDefaultExperienceV1(requestBody: AppClipDefaultExperienceCreateRequest) -> Request<AppClipDefaultExperienceResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipDefaultExperiences",
            method: .post,
            requestBody: requestBody)
    }
}
