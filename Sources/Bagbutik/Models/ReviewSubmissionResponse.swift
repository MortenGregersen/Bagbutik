import Foundation

public struct ReviewSubmissionResponse: Codable {
    /// The resource data.
    public let data: ReviewSubmission
    /// The included related resources.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: ReviewSubmission, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getAppStoreVersionForReview() -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(appStoreVersionForReview) = relationship else { return nil }
            return appStoreVersionForReview
        }.first { $0.id == data.relationships?.appStoreVersionForReview?.data?.id }
    }

    public func getItems() -> [ReviewSubmissionItem] {
        guard let itemIds = data.relationships?.items?.data?.map(\.id),
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
