import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Build
     Expire a build or change its encryption exemption setting.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-builds-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Build representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateBuildV1(id: String,
                              requestBody: BuildUpdateRequest) -> Request<BuildResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
