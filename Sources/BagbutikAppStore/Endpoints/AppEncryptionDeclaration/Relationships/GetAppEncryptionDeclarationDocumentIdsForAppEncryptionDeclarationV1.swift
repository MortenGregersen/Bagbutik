import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the ID of the Document for an App Encryption Declaration

     Get the document id associated with a specific app encryption declaration.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
