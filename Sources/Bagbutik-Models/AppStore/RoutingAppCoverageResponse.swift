import Bagbutik_Core
import Foundation

/**
 # RoutingAppCoverageResponse
 A response that contains a single Routing App Coverages resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/routingappcoverageresponse>
 */
public struct RoutingAppCoverageResponse: Codable {
    public let data: RoutingAppCoverage
    public var included: [AppStoreVersion]?
    public let links: DocumentLinks

    public init(data: RoutingAppCoverage,
                included: [AppStoreVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
