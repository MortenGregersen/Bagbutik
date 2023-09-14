import Bagbutik_Core
import Foundation

/**
 # GameCenterAchievementReleasesResponse
 A response that contains a list of achievement release resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementreleasesresponse>
 */
public struct GameCenterAchievementReleasesResponse: Codable, PagedResponse {
    public typealias Data = GameCenterAchievementRelease

    public let data: [GameCenterAchievementRelease]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterAchievementRelease],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getGameCenterAchievement(for gameCenterAchievementRelease: GameCenterAchievementRelease) -> GameCenterAchievement? {
        included?.compactMap { relationship -> GameCenterAchievement? in
            guard case let .gameCenterAchievement(gameCenterAchievement) = relationship else { return nil }
            return gameCenterAchievement
        }.first { $0.id == gameCenterAchievementRelease.relationships?.gameCenterAchievement?.data?.id }
    }

    public func getGameCenterDetail(for gameCenterAchievementRelease: GameCenterAchievementRelease) -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == gameCenterAchievementRelease.relationships?.gameCenterDetail?.data?.id }
    }

    public enum Included: Codable {
        case gameCenterAchievement(GameCenterAchievement)
        case gameCenterDetail(GameCenterDetail)

        public init(from decoder: Decoder) throws {
            if let gameCenterAchievement = try? GameCenterAchievement(from: decoder) {
                self = .gameCenterAchievement(gameCenterAchievement)
            } else if let gameCenterDetail = try? GameCenterDetail(from: decoder) {
                self = .gameCenterDetail(gameCenterDetail)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterAchievement(value):
                try value.encode(to: encoder)
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
