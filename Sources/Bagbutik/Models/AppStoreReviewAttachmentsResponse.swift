import Foundation

public struct AppStoreReviewAttachmentsResponse: Codable {
    public let data: [AppStoreReviewAttachment]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppStoreReviewAttachment], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
