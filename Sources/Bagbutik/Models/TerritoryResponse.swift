import Foundation

public struct TerritoryResponse: Codable {
    public let data: Territory
    public let links: DocumentLinks

    public init(data: Territory, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
