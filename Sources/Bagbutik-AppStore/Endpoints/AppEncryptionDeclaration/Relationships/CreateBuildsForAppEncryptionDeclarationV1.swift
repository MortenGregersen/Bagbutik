import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Assign Builds to an App Encryption Declaration
     Assign one or more builds to an app encryption declaration.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appEncryptionDeclarations-_id_-relationships-builds>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createBuildsForAppEncryptionDeclarationV1(id: String,
                                                          requestBody: AppEncryptionDeclarationBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appEncryptionDeclarations/\(id)/relationships/builds",
            method: .post,
            requestBody: requestBody)
    }
}
