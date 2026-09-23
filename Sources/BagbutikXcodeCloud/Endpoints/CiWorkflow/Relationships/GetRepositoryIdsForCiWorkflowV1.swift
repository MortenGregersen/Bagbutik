import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Get the repository ID for a CI workflow

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciWorkflows-_id_-relationships-repository>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRepositoryIdsForCiWorkflowV1(id: String) -> Request<CiWorkflowRepositoryLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/ciWorkflows/\(id)/relationships/repository",
            method: .get)
    }
}
