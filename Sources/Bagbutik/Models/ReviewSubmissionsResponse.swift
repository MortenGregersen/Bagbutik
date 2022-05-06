import Foundation

public struct ReviewSubmissionsResponse: Codable, PagedResponse {
    public typealias Data = ReviewSubmission
    /// The resource data.
    public let data: [ReviewSubmission]
    /// The included related resources.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [ReviewSubmission], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
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

    public enum Included: Codable {
        case app(App)
        case appStoreVersion(AppStoreVersion)
        case reviewSubmissionItem(ReviewSubmissionItem)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
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
            case let .app(value):
                try value.encode(to: encoder)
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            case let .reviewSubmissionItem(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
