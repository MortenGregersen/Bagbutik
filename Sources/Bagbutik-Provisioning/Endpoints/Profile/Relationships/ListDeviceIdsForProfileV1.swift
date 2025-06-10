import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/profiles/{id}/relationships/devices

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-profiles-_id_-relationships-devices>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listDeviceIdsForProfileV1(id: String,
                                          limit: Int? = nil) -> Request<ProfileDevicesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/profiles/\(id)/relationships/devices",
            method: .get,
            parameters: .init(limit: limit))
    }
}
