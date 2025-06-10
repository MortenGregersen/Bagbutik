import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/ciXcodeVersions/{id}/relationships/macOsVersions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciXcodeVersions-_id_-relationships-macOsVersions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listMacOsVersionIdsForCiXcodeVersionV1(id: String,
                                                       limit: Int? = nil) -> Request<CiXcodeVersionMacOsVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/ciXcodeVersions/\(id)/relationships/macOsVersions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
