import Foundation

public struct AppInfoLocalizationResponse: Codable {
    public let data: AppInfoLocalization
    public let links: DocumentLinks

    public init(data: AppInfoLocalization, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
