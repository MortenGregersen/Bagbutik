import Bagbutik_Core
import Foundation

/**
 # TerritoryResponse
 A response that contains a single Territories resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/territoryresponse>
 */
public struct TerritoryResponse: Codable {
    public let data: Territory
    public let links: DocumentLinks

    public init(data: Territory,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
