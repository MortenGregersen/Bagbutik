import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Upload an app encryption declaration document

     Add an App Encryption Declaration Document to an existing App Encryption Declaration.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appEncryptionDeclarationDocuments>

     - Parameter requestBody: AppEncryptionDeclarationDocument representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppEncryptionDeclarationDocumentV1(requestBody: AppEncryptionDeclarationDocumentCreateRequest) -> Request<AppEncryptionDeclarationDocumentResponse, ErrorResponse> {
        .init(
            path: "/v1/appEncryptionDeclarationDocuments",
            method: .post,
            requestBody: requestBody)
    }
}
