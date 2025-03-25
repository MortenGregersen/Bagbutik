import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct AppEventsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppEvent

    public let data: [AppEvent]
    public var included: [AppEventLocalization]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppEvent],
                included: [AppEventLocalization]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([AppEvent].self, forKey: "data")
        included = try container.decodeIfPresent([AppEventLocalization].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getLocalizations(for appEvent: AppEvent) -> [AppEventLocalization] {
        guard let localizationIds = appEvent.relationships?.localizations?.data?.map(\.id) else { return [] }
        return included?.filter { localizationIds.contains($0.id) } ?? []
    }
}
