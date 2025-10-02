import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the app ID of a build
     Get the app ID for a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-relationships-app>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppIdsForBuildV1(id: String) -> Request<BuildAppLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/app",
            method: .get)
    }
}
