import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an Android to iOS mapping detail
     Remove a specific Android to iOS mapping detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-androidToIosAppMappingDetails-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAndroidToIosAppMappingDetailV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/androidToIosAppMappingDetails/\(id)",
            method: .delete)
    }
}
