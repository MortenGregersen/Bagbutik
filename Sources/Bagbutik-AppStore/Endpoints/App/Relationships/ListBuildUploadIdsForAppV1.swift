import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all build uploads IDs for an app
     Get a list of all build upload Ids for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-buildUploads>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildUploadIdsForAppV1(id: String,
                                           limit: Int? = nil) -> Request<AppBuildUploadsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/buildUploads",
            method: .get,
            parameters: .init(limit: limit))
    }
}
