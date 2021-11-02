import Foundation

public struct BuildBundleFileSizesResponse: Codable, PagedResponse {
    public typealias Data = BuildBundleFileSize
    public let data: [BuildBundleFileSize]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [BuildBundleFileSize], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
