import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Replace all app previews for an app preview set

     Change the order of the app previews in a preview set.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appPreviewSets-_id_-relationships-appPreviews>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceAppPreviewsForAppPreviewSetV1(id: String,
                                                     requestBody: AppPreviewSetAppPreviewsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appPreviewSets/\(id)/relationships/appPreviews",
            method: .patch,
            requestBody: requestBody)
    }
}
