import BagbutikCore
import BagbutikModelsShared
import BagbutikProvisioningModels

public extension Request {
    /**
     # Delete a profile

     Delete a provisioning profile that is used for app development or distribution.

     ## Discussion

     You can delete provisioning profiles, and may wish to do so if they are expiring or obsolete.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-profiles-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteProfileV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/profiles/\(id)",
            method: .delete)
    }
}
