import Foundation

public struct AppEventScreenshotResponse: Codable {
    public let data: AppEventScreenshot
    public var included: [AppEventLocalization]?
    public let links: DocumentLinks

    public init(data: AppEventScreenshot,
                included: [AppEventLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
