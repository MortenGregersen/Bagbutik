import Foundation

public struct AppEventVideoClipResponse: Codable {
    /// The resource data.
    public let data: AppEventVideoClip
    /// The included related resources.
    public var included: [AppEventLocalization]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppEventVideoClip, included: [AppEventLocalization]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
