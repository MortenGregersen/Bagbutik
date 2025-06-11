import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appEncryptionDeclarations/{id}/appEncryptionDeclarationDocument
     Read the associate document for a specific App Encryption Declaration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEncryptionDeclarations-_id_-appEncryptionDeclarationDocument>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEncryptionDeclarationDocumentForAppEncryptionDeclarationV1(id: String,
                                                                                 fields: [GetAppEncryptionDeclarationDocumentForAppEncryptionDeclarationV1.Field]? = nil) -> Request<AppEncryptionDeclarationDocumentResponse, ErrorResponse> {
        .init(
            path: "/v1/appEncryptionDeclarations/\(id)/appEncryptionDeclarationDocument",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAppEncryptionDeclarationDocumentForAppEncryptionDeclarationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEncryptionDeclarationDocuments
        case appEncryptionDeclarationDocuments([AppEncryptionDeclarationDocuments])

        public enum AppEncryptionDeclarationDocuments: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case assetToken
            case downloadUrl
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations
        }
    }
}
