import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/apps/{id}/relationships/appAvailabilityV2

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-appAvailabilityV2>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppAvailabilityV2IdsForAppV1(id: String) -> Request<AppAppAvailabilityV2LinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/appAvailabilityV2",
            method: .get)
    }
}
