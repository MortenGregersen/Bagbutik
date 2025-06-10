import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/ciMacOsVersions/{id}/relationships/xcodeVersions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciMacOsVersions-_id_-relationships-xcodeVersions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listXcodeVersionIdsForCiMacOsVersionV1(id: String,
                                                       limit: Int? = nil) -> Request<CiMacOsVersionXcodeVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/ciMacOsVersions/\(id)/relationships/xcodeVersions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
