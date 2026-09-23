import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app store version experiment treatment

     Add a new treatment to an App Store version experiment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreVersionExperimentTreatments>

     - Parameter requestBody: AppStoreVersionExperimentTreatment representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionExperimentTreatmentV1(requestBody: AppStoreVersionExperimentTreatmentCreateRequest) -> Request<AppStoreVersionExperimentTreatmentResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionExperimentTreatments",
            method: .post,
            requestBody: requestBody)
    }
}
