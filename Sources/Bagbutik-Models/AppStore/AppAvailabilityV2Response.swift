import Bagbutik_Core
import Foundation

/**
 # AppAvailabilityV2Response
 A response that contains a single app availability resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appavailabilityv2response>
 */
public struct AppAvailabilityV2Response: Codable {
    public let data: AppAvailabilityV2
    public var included: [TerritoryAvailability]?
    public let links: DocumentLinks

    public init(data: AppAvailabilityV2,
                included: [TerritoryAvailability]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
