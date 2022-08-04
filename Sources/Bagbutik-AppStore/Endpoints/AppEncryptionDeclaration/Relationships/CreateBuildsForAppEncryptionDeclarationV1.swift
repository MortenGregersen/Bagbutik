import Bagbutik_Core

public extension Request {
    /**
     # Assign Builds to an App Encryption Declaration
     Assign one or more builds to an app encryption declaration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/assign_builds_to_an_app_encryption_declaration>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBuildsForAppEncryptionDeclarationV1(id: String,
                                                          requestBody: AppEncryptionDeclarationBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/appEncryptionDeclarations/\(id)/relationships/builds", method: .post, requestBody: requestBody)
    }
}
