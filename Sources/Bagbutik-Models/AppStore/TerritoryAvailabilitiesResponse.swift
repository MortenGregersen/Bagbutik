import Bagbutik_Core
import Foundation

/**
 # TerritoryAvailabilitiesResponse
 A response that contains a list of territory availability resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/territoryavailabilitiesresponse>
 */
public struct TerritoryAvailabilitiesResponse: Codable, PagedResponse {
    public typealias Data = TerritoryAvailability

    public let data: [TerritoryAvailability]
    public var included: [Territory]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [TerritoryAvailability],
                included: [Territory]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
