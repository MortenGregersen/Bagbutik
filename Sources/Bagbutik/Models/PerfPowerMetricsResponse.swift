import Foundation

public struct PerfPowerMetricsResponse: Codable {
    public let data: [PerfPowerMetric]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [PerfPowerMetric], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
