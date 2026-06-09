import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Replace all app previews for an app preview set
     Change the order of the app previews in a preview set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appPreviewSets-_id_-relationships-appPreviews>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func replaceAppPreviewsForAppPreviewSetV1(id: String,
                                                     requestBody: AppPreviewSetAppPreviewsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appPreviewSets/\(id)/relationships/appPreviews",
            method: .patch,
            requestBody: requestBody)
    }
}
