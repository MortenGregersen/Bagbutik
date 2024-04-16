import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add an alternative distribution domain
     Add an alternative distribution domain to your account.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/add_an_alternative_distribution_domain>

     - Parameter requestBody: AlternativeDistributionDomain representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAlternativeDistributionDomainV1(requestBody: AlternativeDistributionDomainCreateRequest) -> Request<AlternativeDistributionDomainResponse, ErrorResponse> {
        .init(path: "/v1/alternativeDistributionDomains", method: .post, requestBody: requestBody)
    }
}
