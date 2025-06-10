import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the App Encryption Declaration of a Build
     Read an app encryption declaration associated with a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-appEncryptionDeclaration>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEncryptionDeclarationForBuildV1(id: String,
                                                      fields: [GetAppEncryptionDeclarationForBuildV1.Field]? = nil) -> Request<AppEncryptionDeclarationWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/appEncryptionDeclaration",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAppEncryptionDeclarationForBuildV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEncryptionDeclarations
        case appEncryptionDeclarations([AppEncryptionDeclarations])

        public enum AppEncryptionDeclarations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appDescription
            case appEncryptionDeclarationDocument
            case appEncryptionDeclarationState
            case availableOnFrenchStore
            case builds
            case codeValue
            case containsProprietaryCryptography
            case containsThirdPartyCryptography
            case createdDate
            case documentName
            case documentType
            case documentUrl
            case exempt
            case platform
            case uploadedDate
            case usesEncryption
        }
    }
}
