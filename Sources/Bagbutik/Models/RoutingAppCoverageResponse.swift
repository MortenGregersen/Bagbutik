import Foundation

public struct RoutingAppCoverageResponse: Codable {
    public let data: RoutingAppCoverage
    public let links: DocumentLinks

    public init(data: RoutingAppCoverage, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
