import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app store version experiment treatment localization

     Add a new localization for an App Store version experiment treatment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreVersionExperimentTreatmentLocalizations>

     - Parameter requestBody: AppStoreVersionExperimentTreatmentLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionExperimentTreatmentLocalizationV1(requestBody: AppStoreVersionExperimentTreatmentLocalizationCreateRequest) -> Request<AppStoreVersionExperimentTreatmentLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionExperimentTreatmentLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
