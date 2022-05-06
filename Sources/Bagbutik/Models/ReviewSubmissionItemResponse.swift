import Foundation

public struct ReviewSubmissionItemResponse: Codable {
    /// The resource data.
    public let data: ReviewSubmissionItem
    /// The included related resources.
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: ReviewSubmissionItem, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getAppCustomProductPageVersion() -> AppCustomProductPageVersion? {
        included?.compactMap { relationship -> AppCustomProductPageVersion? in
            guard case let .appCustomProductPageVersion(appCustomProductPageVersion) = relationship else { return nil }
            return appCustomProductPageVersion
        }.first { $0.id == data.relationships?.appCustomProductPageVersion?.data?.id }
    }

    public func getAppEvent() -> AppEvent? {
        included?.compactMap { relationship -> AppEvent? in
            guard case let .appEvent(appEvent) = relationship else { return nil }
            return appEvent
        }.first { $0.id == data.relationships?.appEvent?.data?.id }
    }

    public func getAppStoreVersion() -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(appStoreVersion) = relationship else { return nil }
            return appStoreVersion
        }.first { $0.id == data.relationships?.appStoreVersion?.data?.id }
    }

    public func getAppStoreVersionExperiment() -> AppStoreVersionExperiment? {
        included?.compactMap { relationship -> AppStoreVersionExperiment? in
            guard case let .appStoreVersionExperiment(appStoreVersionExperiment) = relationship else { return nil }
            return appStoreVersionExperiment
        }.first { $0.id == data.relationships?.appStoreVersionExperiment?.data?.id }
    }

    public enum Included: Codable {
        case appCustomProductPageVersion(AppCustomProductPageVersion)
        case appEvent(AppEvent)
        case appStoreVersion(AppStoreVersion)
        case appStoreVersionExperiment(AppStoreVersionExperiment)

        public init(from decoder: Decoder) throws {
            if let appCustomProductPageVersion = try? AppCustomProductPageVersion(from: decoder) {
                self = .appCustomProductPageVersion(appCustomProductPageVersion)
            } else if let appEvent = try? AppEvent(from: decoder) {
                self = .appEvent(appEvent)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else if let appStoreVersionExperiment = try? AppStoreVersionExperiment(from: decoder) {
                self = .appStoreVersionExperiment(appStoreVersionExperiment)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appCustomProductPageVersion(value):
                try value.encode(to: encoder)
            case let .appEvent(value):
                try value.encode(to: encoder)
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            case let .appStoreVersionExperiment(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
