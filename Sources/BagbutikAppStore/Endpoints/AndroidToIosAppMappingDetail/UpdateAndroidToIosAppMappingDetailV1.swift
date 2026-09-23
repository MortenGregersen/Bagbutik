import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an Android to iOS App Mapping Detail

     Update an Android to iOS app mapping detail.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-androidToIosAppMappingDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AndroidToIosAppMappingDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAndroidToIosAppMappingDetailV1(id: String,
                                                     requestBody: AndroidToIosAppMappingDetailUpdateRequest) -> Request<AndroidToIosAppMappingDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/androidToIosAppMappingDetails/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
