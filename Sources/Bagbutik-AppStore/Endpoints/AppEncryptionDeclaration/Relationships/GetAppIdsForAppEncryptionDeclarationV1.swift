import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the app id of an app encryption declaration
     Get the app id from a specific app encryption declaration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEncryptionDeclarations-_id_-relationships-app>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getAppIdsForAppEncryptionDeclarationV1(id: String) -> Request<AppEncryptionDeclarationAppLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appEncryptionDeclarations/\(id)/relationships/app",
            method: .get)
    }
}
