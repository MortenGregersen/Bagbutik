import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Assign the app encryption declaration for a build

     Assign an app encryption declaration to a build.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
