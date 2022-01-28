import Foundation

public struct AppEventScreenshotResponse: Codable {
    /// The resource data.
    public let data: AppEventScreenshot
    /// The included related resources.
    @NullCodable public var included: [AppEventLocalization]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppEventScreenshot, included: [AppEventLocalization]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
