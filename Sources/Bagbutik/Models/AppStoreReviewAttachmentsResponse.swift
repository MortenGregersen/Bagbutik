import Foundation

/**
 A response that contains a list of App Store Review Attachment resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachmentsresponse>
 */
public struct AppStoreReviewAttachmentsResponse: Codable, PagedResponse {
    public typealias Data = AppStoreReviewAttachment
    /// The resource data.
    public let data: [AppStoreReviewAttachment]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppStoreReviewAttachment], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
