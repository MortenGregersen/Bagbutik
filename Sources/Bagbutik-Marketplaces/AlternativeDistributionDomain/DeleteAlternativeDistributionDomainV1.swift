import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an alternative distribution domain
     Delete the alternative distribution search domain for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_alternative_distribution_domain>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAlternativeDistributionDomainV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/alternativeDistributionDomains/\(id)", method: .delete)
    }
}
