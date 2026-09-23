import BagbutikCore
import BagbutikTestFlightModels

public extension Request {
    /**
     # Get the build beta detail ID for a build

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-relationships-buildBetaDetail>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildBetaDetailIdsForBuildV1(id: String) -> Request<BuildBuildBetaDetailLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/buildBetaDetail",
            method: .get)
    }
}
