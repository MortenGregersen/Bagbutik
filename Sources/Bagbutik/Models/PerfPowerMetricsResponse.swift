import Foundation

/// A response that contains a list of Power and Performance Metrics resources.
public struct PerfPowerMetricsResponse: Codable {
    /// The resource data.
    public let data: [PerfPowerMetric]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [PerfPowerMetric], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
