import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a compatiblity relationship
     Create a relationship between two Game Center app versions.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_compatiblity_relationship>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createCompatibilityVersionsForGameCenterAppVersionV1(id: String,
                                                                     requestBody: GameCenterAppVersionCompatibilityVersionsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterAppVersions/\(id)/relationships/compatibilityVersions", method: .post, requestBody: requestBody)
    }
}
