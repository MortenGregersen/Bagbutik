import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/builds/{id}/relationships/buildBetaDetail

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
