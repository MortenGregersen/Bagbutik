import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List the IDs of Android to iOS app mapping details for an app
     Get the IDs of Android to iOS app mapping details for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-androidToIosAppMappingDetails>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAndroidToIosAppMappingDetailIdsForAppV1(id: String,
                                                            limit: Int? = nil) -> Request<AppAndroidToIosAppMappingDetailsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/androidToIosAppMappingDetails",
            method: .get,
            parameters: .init(limit: limit))
    }
}
