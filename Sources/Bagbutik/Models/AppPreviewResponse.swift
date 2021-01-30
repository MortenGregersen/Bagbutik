import Foundation

public struct AppPreviewResponse: Codable {
    public let data: AppPreview
    public let links: DocumentLinks

    public init(data: AppPreview, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
