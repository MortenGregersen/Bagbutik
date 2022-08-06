import Bagbutik_Core
import Foundation

/**
 # AppStoreReviewAttachmentsResponse
 A response that contains a list of App Store Review Attachment resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachmentsresponse>
 */
public struct AppStoreReviewAttachmentsResponse: Codable, PagedResponse {
    public typealias Data = AppStoreReviewAttachment

    public let data: [AppStoreReviewAttachment]
    public var included: [AppStoreReviewDetail]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppStoreReviewAttachment],
                included: [AppStoreReviewDetail]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
