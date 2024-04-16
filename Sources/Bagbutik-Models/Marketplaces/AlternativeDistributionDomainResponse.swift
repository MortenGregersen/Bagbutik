import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionDomainResponse
 A response that contains a single alternative distribution domain resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributiondomainresponse>
 */
public struct AlternativeDistributionDomainResponse: Codable {
    public let data: AlternativeDistributionDomain
    public let links: DocumentLinks

    public init(data: AlternativeDistributionDomain,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
