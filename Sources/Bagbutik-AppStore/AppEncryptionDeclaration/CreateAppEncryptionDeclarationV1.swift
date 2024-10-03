import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an app encryption declarations
     Add an app encryption delcaration for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appEncryptionDeclarations>

     - Parameter requestBody: AppEncryptionDeclaration representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppEncryptionDeclarationV1(requestBody: AppEncryptionDeclarationCreateRequest) -> Request<AppEncryptionDeclarationResponse, ErrorResponse> {
        .init(path: "/v1/appEncryptionDeclarations", method: .post, requestBody: requestBody)
    }
}
