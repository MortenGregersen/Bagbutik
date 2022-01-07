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
    /// The included related resources.
    @NullCodable public var included: [AppStoreReviewDetail]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [AppStoreReviewAttachment], included: [AppStoreReviewDetail]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
