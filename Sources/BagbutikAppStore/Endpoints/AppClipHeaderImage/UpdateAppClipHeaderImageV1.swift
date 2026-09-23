import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an app clip card image

     Change the image that appears on the App Clip card of a default App Clip experience.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appClipHeaderImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppClipHeaderImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppClipHeaderImageV1(id: String,
                                           requestBody: AppClipHeaderImageUpdateRequest) -> Request<AppClipHeaderImageResponse, ErrorResponse> {
        .init(
            path: "/v1/appClipHeaderImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
