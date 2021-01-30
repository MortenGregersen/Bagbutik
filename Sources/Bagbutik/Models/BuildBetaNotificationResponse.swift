import Foundation

public struct BuildBetaNotificationResponse: Codable {
    public let data: BuildBetaNotification
    public let links: DocumentLinks

    public init(data: BuildBetaNotification, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
