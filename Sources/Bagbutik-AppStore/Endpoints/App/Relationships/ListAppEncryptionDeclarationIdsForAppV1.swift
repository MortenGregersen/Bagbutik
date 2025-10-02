import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read an app’s encryption declaration IDs
     Find and list all available app encryption declaration IDs for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-appEncryptionDeclarations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppEncryptionDeclarationIdsForAppV1(id: String,
                                                        limit: Int? = nil) -> Request<AppAppEncryptionDeclarationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/appEncryptionDeclarations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
