import Foundation

/**
 A response that contains a list of Power and Performance Metrics resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/perfpowermetricsresponse>
 */
public struct PerfPowerMetricsResponse: Codable, PagedResponse {
    public typealias Data = PerfPowerMetric
    /// The resource data.
    public let data: [PerfPowerMetric]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [PerfPowerMetric], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
