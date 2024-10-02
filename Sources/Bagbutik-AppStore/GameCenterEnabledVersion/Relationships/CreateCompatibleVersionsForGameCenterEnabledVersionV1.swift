import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add Compatible Versions to a Game Center Enabled Version

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterEnabledVersions-_id_-relationships-compatibleVersions>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createCompatibleVersionsForGameCenterEnabledVersionV1(id: String,
                                                                      requestBody: GameCenterEnabledVersionCompatibleVersionsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterEnabledVersions/\(id)/relationships/compatibleVersions", method: .post, requestBody: requestBody)
    }
}
