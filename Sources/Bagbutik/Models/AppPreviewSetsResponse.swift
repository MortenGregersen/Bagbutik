import Foundation

public struct AppPreviewSetsResponse: Codable {
    public let data: [AppPreviewSet]
    public let included: [AppPreview]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppPreviewSet], included: [AppPreview]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
