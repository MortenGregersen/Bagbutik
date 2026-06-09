import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the App Store version ID for a build

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-relationships-appStoreVersion>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreVersionIdsForBuildV1(id: String) -> Request<BuildAppStoreVersionLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/appStoreVersion",
            method: .get)
    }
}
