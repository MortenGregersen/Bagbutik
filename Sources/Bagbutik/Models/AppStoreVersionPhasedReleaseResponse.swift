import Foundation

public struct AppStoreVersionPhasedReleaseResponse: Codable {
    public let data: AppStoreVersionPhasedRelease
    public let links: DocumentLinks

    public init(data: AppStoreVersionPhasedRelease, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
