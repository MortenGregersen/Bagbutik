import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the id of the document for an app encryption declaration
     Get the document id associated with a specific app encryption declaration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEncryptionDeclarations-_id_-relationships-appEncryptionDeclarationDocument>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEncryptionDeclarationDocumentIdsForAppEncryptionDeclarationV1(id: String) -> Request<AppEncryptionDeclarationAppEncryptionDeclarationDocumentLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appEncryptionDeclarations/\(id)/relationships/appEncryptionDeclarationDocument",
            method: .get)
    }
}
