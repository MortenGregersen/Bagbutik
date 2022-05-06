import Foundation

public struct AppEventResponse: Codable {
    /// The resource data.
    public let data: AppEvent
    /// The included related resources.
    public var included: [AppEventLocalization]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppEvent, included: [AppEventLocalization]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
