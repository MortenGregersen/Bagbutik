import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Assign the App Encryption Declaration for a Build
     Assign an app encryption declaration to a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-builds-_id_-relationships-appEncryptionDeclaration>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Related linkage
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppEncryptionDeclarationForBuildV1(id: String,
                                                         requestBody: BuildAppEncryptionDeclarationLinkageRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/appEncryptionDeclaration",
            method: .patch,
            requestBody: requestBody)
    }
}
