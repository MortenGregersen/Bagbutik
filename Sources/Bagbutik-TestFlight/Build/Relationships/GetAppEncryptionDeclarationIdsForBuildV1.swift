import Bagbutik_Models

public extension Request {
    /**
     # Assign the App Encryption Declaration for a Build
     Assign an app encryption declaration to a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/assign_the_app_encryption_declaration_for_a_build>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEncryptionDeclarationIdsForBuildV1(id: String) -> Request<BuildAppEncryptionDeclarationLinkageResponse, ErrorResponse> {
        .init(path: "/v1/builds/\(id)/relationships/appEncryptionDeclaration", method: .get)
    }
}
