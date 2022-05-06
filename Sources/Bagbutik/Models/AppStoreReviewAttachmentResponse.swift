import Foundation

/**
 A response that contains a single App Store Review Attachments resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachmentresponse>
 */
public struct AppStoreReviewAttachmentResponse: Codable {
    /// The resource data.
    public let data: AppStoreReviewAttachment
    /// The included related resources.
    public var included: [AppStoreReviewDetail]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreReviewAttachment, included: [AppStoreReviewDetail]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
