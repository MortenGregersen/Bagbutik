import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Replace All App Previews for an App Preview Set
     Change the order of the app previews in a preview set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appPreviewSets-_id_-relationships-appPreviews>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceAppPreviewsForAppPreviewSetV1(id: String,
                                                     requestBody: AppPreviewSetAppPreviewsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/appPreviewSets/\(id)/relationships/appPreviews", method: .patch, requestBody: requestBody)
    }
}
