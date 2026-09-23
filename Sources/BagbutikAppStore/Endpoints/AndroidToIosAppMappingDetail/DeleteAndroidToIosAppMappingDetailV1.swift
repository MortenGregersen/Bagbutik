import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete an Android to iOS Mapping Detail

     Remove a specific Android to iOS mapping detail.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-androidToIosAppMappingDetails-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAndroidToIosAppMappingDetailV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/androidToIosAppMappingDetails/\(id)",
            method: .delete)
    }
}
