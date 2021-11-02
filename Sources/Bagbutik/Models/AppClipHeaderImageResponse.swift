import Foundation

public struct AppClipHeaderImageResponse: Codable {
    public let data: AppClipHeaderImage
    public let included: [AppClipDefaultExperienceLocalization]?
    public let links: DocumentLinks

    public init(data: AppClipHeaderImage, included: [AppClipDefaultExperienceLocalization]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
