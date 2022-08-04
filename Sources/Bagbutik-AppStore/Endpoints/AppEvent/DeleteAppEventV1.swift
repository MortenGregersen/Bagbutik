import Bagbutik_Core

public extension Request {
    /**
     # Delete an App Event
     Delete an in-app event and its related metadata.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_v1_appevents_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppEventV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appEvents/\(id)", method: .delete)
    }
}
