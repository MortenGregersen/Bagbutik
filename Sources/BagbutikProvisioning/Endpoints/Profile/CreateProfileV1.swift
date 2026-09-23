import BagbutikCore
import BagbutikProvisioningModels

public extension Request {
    /**
     # Create a profile

     Create a new provisioning profile.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-profiles>

     - Parameter requestBody: Profile representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createProfileV1(requestBody: ProfileCreateRequest) -> Request<ProfileResponse, ErrorResponse> {
        .init(
            path: "/v1/profiles",
            method: .post,
            requestBody: requestBody)
    }
}
