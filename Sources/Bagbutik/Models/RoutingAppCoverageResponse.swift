import Foundation

/// A response that contains a single Routing App Coverages resource.
public struct RoutingAppCoverageResponse: Codable {
    /// The resource data.
    public let data: RoutingAppCoverage
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: RoutingAppCoverage, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
