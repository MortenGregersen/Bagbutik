import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # PATCH /v1/appEvents/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appEvents-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppEvent representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppEventV1(id: String,
                                 requestBody: AppEventUpdateRequest) -> Request<AppEventResponse, ErrorResponse> {
        .init(
            path: "/v1/appEvents/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
