import Bagbutik_Core
import Foundation

public struct ReviewSubmissionsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = ReviewSubmission

    public let data: [ReviewSubmission]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [ReviewSubmission],
                included: [Included]? = nil,
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
        data = try container.decode([ReviewSubmission].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
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

    public func getApp(for reviewSubmission: ReviewSubmission) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == reviewSubmission.relationships?.app?.data?.id }
    }

    public func getAppStoreVersionForReview(for reviewSubmission: ReviewSubmission) -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(appStoreVersionForReview) = relationship else { return nil }
            return appStoreVersionForReview
        }.first { $0.id == reviewSubmission.relationships?.appStoreVersionForReview?.data?.id }
    }

    public func getItems(for reviewSubmission: ReviewSubmission) -> [ReviewSubmissionItem] {
        guard let itemIds = reviewSubmission.relationships?.items?.data?.map(\.id),
              let items = included?.compactMap({ relationship -> ReviewSubmissionItem? in
                  guard case let .reviewSubmissionItem(item) = relationship else { return nil }
                  return itemIds.contains(item.id) ? item : nil
              })
        else {
            return []
        }
        return items
    }

    public func getLastUpdatedByActor(for reviewSubmission: ReviewSubmission) -> Actor? {
        included?.compactMap { relationship -> Actor? in
            guard case let .actor(lastUpdatedByActor) = relationship else { return nil }
            return lastUpdatedByActor
        }.first { $0.id == reviewSubmission.relationships?.lastUpdatedByActor?.data?.id }
    }

    public func getSubmittedByActor(for reviewSubmission: ReviewSubmission) -> Actor? {
        included?.compactMap { relationship -> Actor? in
            guard case let .actor(submittedByActor) = relationship else { return nil }
            return submittedByActor
        }.first { $0.id == reviewSubmission.relationships?.submittedByActor?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case actor(Actor)
        case app(App)
        case appStoreVersion(AppStoreVersion)
        case reviewSubmissionItem(ReviewSubmissionItem)

        public init(from decoder: Decoder) throws {
            if let actor = try? Actor(from: decoder) {
                self = .actor(actor)
            } else if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else if let reviewSubmissionItem = try? ReviewSubmissionItem(from: decoder) {
                self = .reviewSubmissionItem(reviewSubmissionItem)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .actor(value):
                try value.encode(to: encoder)
            case let .app(value):
                try value.encode(to: encoder)
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            case let .reviewSubmissionItem(value):
                try value.encode(to: encoder)
            }
        }
    }
}
