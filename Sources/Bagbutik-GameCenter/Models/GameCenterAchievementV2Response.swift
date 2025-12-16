import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterAchievementV2Response
 A response that contains a single Game Center achievement v2 resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementv2response>
 */
public struct GameCenterAchievementV2Response: Codable, Sendable {
    public let data: GameCenterAchievementV2
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterAchievementV2,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterAchievementV2.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getActivity() -> GameCenterActivity? {
        included?.compactMap { relationship -> GameCenterActivity? in
            guard case let .gameCenterActivity(activity) = relationship else { return nil }
            return activity
        }.first { $0.id == data.relationships?.activity?.data?.id }
    }

    public func getGameCenterDetail() -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == data.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterGroup() -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == data.relationships?.gameCenterGroup?.data?.id }
    }

    public func getVersions() -> [GameCenterAchievementVersionV2] {
        guard let versionIds = data.relationships?.versions?.data?.map(\.id),
              let versions = included?.compactMap({ relationship -> GameCenterAchievementVersionV2? in
                  guard case let .gameCenterAchievementVersionV2(version) = relationship else { return nil }
                  return versionIds.contains(version.id) ? version : nil
              })
        else {
            return []
        }
        return versions
    }

    public enum Included: Codable, Sendable {
        case gameCenterAchievementVersionV2(GameCenterAchievementVersionV2)
        case gameCenterActivity(GameCenterActivity)
        case gameCenterDetail(GameCenterDetail)
        case gameCenterGroup(GameCenterGroup)

        public init(from decoder: Decoder) throws {
            if let gameCenterAchievementVersionV2 = try? GameCenterAchievementVersionV2(from: decoder) {
                self = .gameCenterAchievementVersionV2(gameCenterAchievementVersionV2)
            } else if let gameCenterActivity = try? GameCenterActivity(from: decoder) {
                self = .gameCenterActivity(gameCenterActivity)
            } else if let gameCenterDetail = try? GameCenterDetail(from: decoder) {
                self = .gameCenterDetail(gameCenterDetail)
            } else if let gameCenterGroup = try? GameCenterGroup(from: decoder) {
                self = .gameCenterGroup(gameCenterGroup)
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
            case let .gameCenterAchievementVersionV2(value):
                try value.encode(to: encoder)
            case let .gameCenterActivity(value):
                try value.encode(to: encoder)
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterGroup(value):
                try value.encode(to: encoder)
            }
        }
    }
}
