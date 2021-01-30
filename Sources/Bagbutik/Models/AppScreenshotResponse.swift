import Foundation

public struct AppScreenshotResponse: Codable {
    public let data: AppScreenshot
    public let links: DocumentLinks

    public init(data: AppScreenshot, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
