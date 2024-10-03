import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read a specific App Encryption Declaration Document
     Get detailed information about a specified App Encryption Declaration document.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEncryptionDeclarationDocuments-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEncryptionDeclarationDocumentV1(id: String,
                                                      fields: [GetAppEncryptionDeclarationDocumentV1.Field]? = nil) -> Request<AppEncryptionDeclarationDocumentResponse, ErrorResponse>
    {
        .init(path: "/v1/appEncryptionDeclarationDocuments/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAppEncryptionDeclarationDocumentV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEncryptionDeclarationDocuments
        case appEncryptionDeclarationDocuments([AppEncryptionDeclarationDocuments])

        public enum AppEncryptionDeclarationDocuments: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appEncryptionDeclaration
            case assetDeliveryState
            case assetToken
            case downloadUrl
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations
            case uploaded
        }
    }
}
