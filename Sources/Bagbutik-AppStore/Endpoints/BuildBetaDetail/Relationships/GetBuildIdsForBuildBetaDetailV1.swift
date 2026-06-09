import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the build ID for a build beta detail

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildBetaDetails-_id_-relationships-build>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildIdsForBuildBetaDetailV1(id: String) -> Request<BuildBetaDetailBuildLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/buildBetaDetails/\(id)/relationships/build",
            method: .get)
    }
}
