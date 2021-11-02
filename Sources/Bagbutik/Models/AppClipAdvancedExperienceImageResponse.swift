import Foundation

public struct AppClipAdvancedExperienceImageResponse: Codable {
    public let data: AppClipAdvancedExperienceImage
    public let links: DocumentLinks

    public init(data: AppClipAdvancedExperienceImage, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
