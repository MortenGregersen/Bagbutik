import Foundation

public struct BundleIdCapabilitiesResponse: Codable {
    public let data: [BundleIdCapability]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [BundleIdCapability], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
