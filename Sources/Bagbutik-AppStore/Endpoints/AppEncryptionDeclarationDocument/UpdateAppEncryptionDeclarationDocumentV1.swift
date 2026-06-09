import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an app encryption declaration document
     Commit an App Encryption Declaration Document after uploading it.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appEncryptionDeclarationDocuments-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppEncryptionDeclarationDocument representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppEncryptionDeclarationDocumentV1(id: String,
                                                         requestBody: AppEncryptionDeclarationDocumentUpdateRequest) -> Request<AppEncryptionDeclarationDocumentResponse, ErrorResponse> {
        .init(
            path: "/v1/appEncryptionDeclarationDocuments/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
