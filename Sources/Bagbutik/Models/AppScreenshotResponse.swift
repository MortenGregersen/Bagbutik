import Foundation

/// A response that contains a single App Screenshots resource.
public struct AppScreenshotResponse: Codable {
    /// The resource data.
    public let data: AppScreenshot
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppScreenshot, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
