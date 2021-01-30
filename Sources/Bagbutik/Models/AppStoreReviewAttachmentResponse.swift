import Foundation

public struct AppStoreReviewAttachmentResponse: Codable {
    public let data: AppStoreReviewAttachment
    public let links: DocumentLinks

    public init(data: AppStoreReviewAttachment, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
