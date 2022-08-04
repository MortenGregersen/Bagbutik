import Foundation
import Bagbutik_Core

/**
 # AppStoreReviewAttachmentResponse
 A response that contains a single App Store Review Attachments resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachmentresponse>
 */
public struct AppStoreReviewAttachmentResponse: Codable {
    public let data: AppStoreReviewAttachment
    public var included: [AppStoreReviewDetail]?
    public let links: DocumentLinks

    public init(data: AppStoreReviewAttachment,
                included: [AppStoreReviewDetail]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
