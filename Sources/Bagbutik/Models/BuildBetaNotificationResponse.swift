import Foundation

/// A response that contains a single Build Beta Notifications resource.
public struct BuildBetaNotificationResponse: Codable {
    /// The resource data.
    public let data: BuildBetaNotification
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BuildBetaNotification, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
