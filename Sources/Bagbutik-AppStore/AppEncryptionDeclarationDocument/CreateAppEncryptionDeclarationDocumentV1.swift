import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Upload an App Encryption Declaration Document
     Add an App Encryption Declaration Document to an existing App Encryption Declaration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/upload_an_app_encryption_declaration_document>

     - Parameter requestBody: AppEncryptionDeclarationDocument representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppEncryptionDeclarationDocumentV1(requestBody: AppEncryptionDeclarationDocumentCreateRequest) -> Request<AppEncryptionDeclarationDocumentResponse, ErrorResponse> {
        .init(path: "/v1/appEncryptionDeclarationDocuments", method: .post, requestBody: requestBody)
    }
}
