import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the App Encryption Declaration ID for a Build
     Get the beta app encryption declaration resource ID associated with a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-relationships-appEncryptionDeclaration>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEncryptionDeclarationIdsForBuildV1(id: String) -> Request<BuildAppEncryptionDeclarationLinkageResponse, ErrorResponse> {
        .init(path: "/v1/builds/\(id)/relationships/appEncryptionDeclaration", method: .get)
    }
}
