import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a marketplace search detail URL
     Delete search detail URL for the alternative marketplace.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-marketplaceSearchDetails-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteMarketplaceSearchDetailV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/marketplaceSearchDetails/\(id)", method: .delete)
    }
}
