import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Product
     Delete an Xcode Cloud product and all of its associated workflows, builds, and artifacts.

     To delete an Xcode Cloud product, call this endpoint using the HTTP `DELETE` method like this:
     ```
     https://api.appstoreconnect.apple.com/v1/ciProducts/9ad354b0-f380-40d3-b94f-dd5225b8b3d5
     ```
     App Store Connect confirms the deletion by responding with the `HTTP/1.1 204 No Content` HTTP status code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-ciProducts-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteCiProductV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/ciProducts/\(id)", method: .delete)
    }
}
