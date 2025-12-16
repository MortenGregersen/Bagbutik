import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct ReviewSubmissionItemsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = ReviewSubmissionItem

    public let data: [ReviewSubmissionItem]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [ReviewSubmissionItem],
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
        data = try container.decode([ReviewSubmissionItem].self, forKey: "data")
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

    public func getAppCustomProductPageVersion(for reviewSubmissionItem: ReviewSubmissionItem) -> AppCustomProductPageVersion? {
        included?.compactMap { relationship -> AppCustomProductPageVersion? in
            guard case let .appCustomProductPageVersion(appCustomProductPageVersion) = relationship else { return nil }
            return appCustomProductPageVersion
        }.first { $0.id == reviewSubmissionItem.relationships?.appCustomProductPageVersion?.data?.id }
    }

    public func getAppEvent(for reviewSubmissionItem: ReviewSubmissionItem) -> AppEvent? {
        included?.compactMap { relationship -> AppEvent? in
            guard case let .appEvent(appEvent) = relationship else { return nil }
            return appEvent
        }.first { $0.id == reviewSubmissionItem.relationships?.appEvent?.data?.id }
    }

    public func getAppStoreVersion(for reviewSubmissionItem: ReviewSubmissionItem) -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(appStoreVersion) = relationship else { return nil }
            return appStoreVersion
        }.first { $0.id == reviewSubmissionItem.relationships?.appStoreVersion?.data?.id }
    }

    public func getAppStoreVersionExperiment(for reviewSubmissionItem: ReviewSubmissionItem) -> AppStoreVersionExperiment? {
        included?.compactMap { relationship -> AppStoreVersionExperiment? in
            guard case let .appStoreVersionExperiment(appStoreVersionExperiment) = relationship else { return nil }
            return appStoreVersionExperiment
        }.first { $0.id == reviewSubmissionItem.relationships?.appStoreVersionExperiment?.data?.id }
    }

    public func getAppStoreVersionExperimentV2(for reviewSubmissionItem: ReviewSubmissionItem) -> AppStoreVersionExperiment? {
        included?.compactMap { relationship -> AppStoreVersionExperiment? in
            guard case let .appStoreVersionExperiment(appStoreVersionExperimentV2) = relationship else { return nil }
            return appStoreVersionExperimentV2
        }.first { $0.id == reviewSubmissionItem.relationships?.appStoreVersionExperimentV2?.data?.id }
    }

    public func getBackgroundAssetVersion(for reviewSubmissionItem: ReviewSubmissionItem) -> BackgroundAssetVersion? {
        included?.compactMap { relationship -> BackgroundAssetVersion? in
            guard case let .backgroundAssetVersion(backgroundAssetVersion) = relationship else { return nil }
            return backgroundAssetVersion
        }.first { $0.id == reviewSubmissionItem.relationships?.backgroundAssetVersion?.data?.id }
    }

    public func getGameCenterAchievementVersion(for reviewSubmissionItem: ReviewSubmissionItem) -> GameCenterAchievementVersionV2? {
        included?.compactMap { relationship -> GameCenterAchievementVersionV2? in
            guard case let .gameCenterAchievementVersionV2(gameCenterAchievementVersion) = relationship else { return nil }
            return gameCenterAchievementVersion
        }.first { $0.id == reviewSubmissionItem.relationships?.gameCenterAchievementVersion?.data?.id }
    }

    public func getGameCenterActivityVersion(for reviewSubmissionItem: ReviewSubmissionItem) -> GameCenterActivityVersion? {
        included?.compactMap { relationship -> GameCenterActivityVersion? in
            guard case let .gameCenterActivityVersion(gameCenterActivityVersion) = relationship else { return nil }
            return gameCenterActivityVersion
        }.first { $0.id == reviewSubmissionItem.relationships?.gameCenterActivityVersion?.data?.id }
    }

    public func getGameCenterChallengeVersion(for reviewSubmissionItem: ReviewSubmissionItem) -> GameCenterChallengeVersion? {
        included?.compactMap { relationship -> GameCenterChallengeVersion? in
            guard case let .gameCenterChallengeVersion(gameCenterChallengeVersion) = relationship else { return nil }
            return gameCenterChallengeVersion
        }.first { $0.id == reviewSubmissionItem.relationships?.gameCenterChallengeVersion?.data?.id }
    }

    public func getGameCenterLeaderboardSetVersion(for reviewSubmissionItem: ReviewSubmissionItem) -> GameCenterLeaderboardSetVersionV2? {
        included?.compactMap { relationship -> GameCenterLeaderboardSetVersionV2? in
            guard case let .gameCenterLeaderboardSetVersionV2(gameCenterLeaderboardSetVersion) = relationship else { return nil }
            return gameCenterLeaderboardSetVersion
        }.first { $0.id == reviewSubmissionItem.relationships?.gameCenterLeaderboardSetVersion?.data?.id }
    }

    public func getGameCenterLeaderboardVersion(for reviewSubmissionItem: ReviewSubmissionItem) -> GameCenterLeaderboardVersionV2? {
        included?.compactMap { relationship -> GameCenterLeaderboardVersionV2? in
            guard case let .gameCenterLeaderboardVersionV2(gameCenterLeaderboardVersion) = relationship else { return nil }
            return gameCenterLeaderboardVersion
        }.first { $0.id == reviewSubmissionItem.relationships?.gameCenterLeaderboardVersion?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appCustomProductPageVersion(AppCustomProductPageVersion)
        case appEvent(AppEvent)
        case appStoreVersion(AppStoreVersion)
        case appStoreVersionExperiment(AppStoreVersionExperiment)
        case backgroundAssetVersion(BackgroundAssetVersion)
        case gameCenterAchievementVersionV2(GameCenterAchievementVersionV2)
        case gameCenterActivityVersion(GameCenterActivityVersion)
        case gameCenterChallengeVersion(GameCenterChallengeVersion)
        case gameCenterLeaderboardSetVersionV2(GameCenterLeaderboardSetVersionV2)
        case gameCenterLeaderboardVersionV2(GameCenterLeaderboardVersionV2)

        public init(from decoder: Decoder) throws {
            if let appCustomProductPageVersion = try? AppCustomProductPageVersion(from: decoder) {
                self = .appCustomProductPageVersion(appCustomProductPageVersion)
            } else if let appEvent = try? AppEvent(from: decoder) {
                self = .appEvent(appEvent)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else if let appStoreVersionExperiment = try? AppStoreVersionExperiment(from: decoder) {
                self = .appStoreVersionExperiment(appStoreVersionExperiment)
            } else if let backgroundAssetVersion = try? BackgroundAssetVersion(from: decoder) {
                self = .backgroundAssetVersion(backgroundAssetVersion)
            } else if let gameCenterAchievementVersionV2 = try? GameCenterAchievementVersionV2(from: decoder) {
                self = .gameCenterAchievementVersionV2(gameCenterAchievementVersionV2)
            } else if let gameCenterActivityVersion = try? GameCenterActivityVersion(from: decoder) {
                self = .gameCenterActivityVersion(gameCenterActivityVersion)
            } else if let gameCenterChallengeVersion = try? GameCenterChallengeVersion(from: decoder) {
                self = .gameCenterChallengeVersion(gameCenterChallengeVersion)
            } else if let gameCenterLeaderboardSetVersionV2 = try? GameCenterLeaderboardSetVersionV2(from: decoder) {
                self = .gameCenterLeaderboardSetVersionV2(gameCenterLeaderboardSetVersionV2)
            } else if let gameCenterLeaderboardVersionV2 = try? GameCenterLeaderboardVersionV2(from: decoder) {
                self = .gameCenterLeaderboardVersionV2(gameCenterLeaderboardVersionV2)
            } else {
                throw DecodingError.typeMismatch(
                    Included.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
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
            case let .backgroundAssetVersion(value):
                try value.encode(to: encoder)
            case let .gameCenterAchievementVersionV2(value):
                try value.encode(to: encoder)
            case let .gameCenterActivityVersion(value):
                try value.encode(to: encoder)
            case let .gameCenterChallengeVersion(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSetVersionV2(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardVersionV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
