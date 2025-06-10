import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a marketplace domain
     Delete the alternative marketplace search domain for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-marketplaceDomains-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func deleteMarketplaceDomainV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/marketplaceDomains/\(id)",
            method: .delete)
    }
}
