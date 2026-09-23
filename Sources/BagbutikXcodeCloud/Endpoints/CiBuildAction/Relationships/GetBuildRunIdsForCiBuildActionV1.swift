import BagbutikCore
import BagbutikXcodeCloudModels

public extension Request {
    /**
     # Get the build run ID for a CI build action

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciBuildActions-_id_-relationships-buildRun>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildRunIdsForCiBuildActionV1(id: String) -> Request<CiBuildActionBuildRunLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/ciBuildActions/\(id)/relationships/buildRun",
            method: .get)
    }
}
