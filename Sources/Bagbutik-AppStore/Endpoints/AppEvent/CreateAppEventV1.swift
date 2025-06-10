import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/appEvents

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appEvents>

     - Parameter requestBody: AppEvent representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppEventV1(requestBody: AppEventCreateRequest) -> Request<AppEventResponse, ErrorResponse> {
        .init(
            path: "/v1/appEvents",
            method: .post,
            requestBody: requestBody)
    }
}
