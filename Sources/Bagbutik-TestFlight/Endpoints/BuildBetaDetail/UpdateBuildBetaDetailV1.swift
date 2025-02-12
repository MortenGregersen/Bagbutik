import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Build Beta Detail
     Update beta test details for a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-buildBetaDetails-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: BuildBetaDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBuildBetaDetailV1(id: String,
                                        requestBody: BuildBetaDetailUpdateRequest) -> Request<BuildBetaDetailResponse, ErrorResponse>
    {
        .init(path: "/v1/buildBetaDetails/\(id)", method: .patch, requestBody: requestBody)
    }
}
