import Bagbutik_Core
import Foundation

public struct BetaAppLocalizationsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = BetaAppLocalization

    public let data: [BetaAppLocalization]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BetaAppLocalization],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([BetaAppLocalization].self, forKey: .data)
        links = try container.decode(PagedDocumentLinks.self, forKey: .links)
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(meta, forKey: .meta)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case links
        case meta
    }
}
