import Foundation

public struct AppScreenshotSetResponse: Codable {
    public let data: AppScreenshotSet
    public let included: [AppScreenshot]?
    public let links: DocumentLinks

    public init(data: AppScreenshotSet, included: [AppScreenshot]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
