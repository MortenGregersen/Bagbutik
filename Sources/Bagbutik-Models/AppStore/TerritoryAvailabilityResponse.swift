import Bagbutik_Core
import Foundation

/**
 # TerritoryAvailabilityResponse
 A response that contains a single territory availability resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/territoryavailabilityresponse>
 */
public struct TerritoryAvailabilityResponse: Codable {
    public let data: TerritoryAvailability
    public var included: [Territory]?
    public let links: DocumentLinks

    public init(data: TerritoryAvailability,
                included: [Territory]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
