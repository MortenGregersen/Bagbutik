import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Event Screenshot
     Delete a specific screenshot from an in-app event.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appeventscreenshots_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppEventScreenshotV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appEventScreenshots/\(id)", method: .delete)
    }
}
