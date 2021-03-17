import Foundation

/// A response that contains a single Territories resource.
public struct TerritoryResponse: Codable {
    /// The resource data.
    public let data: Territory
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: Territory, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
