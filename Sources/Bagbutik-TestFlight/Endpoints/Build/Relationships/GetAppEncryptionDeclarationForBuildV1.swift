import Bagbutik_Core

public extension Request {
    /**
     # Read the App Encryption Declaration of a Build
     Read an app encryption declaration associated with a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_app_encryption_declaration_of_a_build>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEncryptionDeclarationForBuildV1(id: String,
                                                      fields: [GetAppEncryptionDeclarationForBuildV1.Field]? = nil) -> Request<AppEncryptionDeclarationResponse, ErrorResponse>
    {
        .init(path: "/v1/builds/\(id)/appEncryptionDeclaration", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAppEncryptionDeclarationForBuildV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEncryptionDeclarations
        case appEncryptionDeclarations([AppEncryptionDeclarations])

        public enum AppEncryptionDeclarations: String, ParameterValue, CaseIterable {
            case app
            case appEncryptionDeclarationState
            case availableOnFrenchStore
            case builds
            case codeValue
            case containsProprietaryCryptography
            case containsThirdPartyCryptography
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
