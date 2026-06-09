import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardSetsResponse
 The response body for endpoints that list Game Center leaderboard sets.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardsetsresponse>
 */
public struct GameCenterLeaderboardSetsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterLeaderboardSet

    public let data: [GameCenterLeaderboardSet]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterLeaderboardSet],
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
        data = try container.decode([GameCenterLeaderboardSet].self, forKey: "data")
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

    public func getGameCenterDetail(for gameCenterLeaderboardSet: GameCenterLeaderboardSet) -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == gameCenterLeaderboardSet.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterGroup(for gameCenterLeaderboardSet: GameCenterLeaderboardSet) -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == gameCenterLeaderboardSet.relationships?.gameCenterGroup?.data?.id }
    }

    public func getGameCenterLeaderboards(for gameCenterLeaderboardSet: GameCenterLeaderboardSet) -> [GameCenterLeaderboard] {
        guard let gameCenterLeaderboardIds = gameCenterLeaderboardSet.relationships?.gameCenterLeaderboards?.data?.map(\.id),
              let gameCenterLeaderboards = included?.compactMap({ relationship -> GameCenterLeaderboard? in
                  guard case let .gameCenterLeaderboard(gameCenterLeaderboard) = relationship else { return nil }
                  return gameCenterLeaderboardIds.contains(gameCenterLeaderboard.id) ? gameCenterLeaderboard : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboards
    }

    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    public func getGroupLeaderboardSet(for gameCenterLeaderboardSet: GameCenterLeaderboardSet) -> GameCenterLeaderboardSet? {
        included?.compactMap { relationship -> GameCenterLeaderboardSet? in
            guard case let .gameCenterLeaderboardSet(groupLeaderboardSet) = relationship else { return nil }
            return groupLeaderboardSet
        }.first { $0.id == gameCenterLeaderboardSet.relationships?.groupLeaderboardSet?.data?.id }
    }

    public func getLocalizations(for gameCenterLeaderboardSet: GameCenterLeaderboardSet) -> [GameCenterLeaderboardSetLocalization] {
        guard let localizationIds = gameCenterLeaderboardSet.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> GameCenterLeaderboardSetLocalization? in
                  guard case let .gameCenterLeaderboardSetLocalization(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public func getReleases(for gameCenterLeaderboardSet: GameCenterLeaderboardSet) -> [GameCenterLeaderboardSetRelease] {
        guard let releaseIds = gameCenterLeaderboardSet.relationships?.releases?.data?.map(\.id),
              let releases = included?.compactMap({ relationship -> GameCenterLeaderboardSetRelease? in
                  guard case let .gameCenterLeaderboardSetRelease(release) = relationship else { return nil }
                  return releaseIds.contains(release.id) ? release : nil
              })
        else {
            return []
        }
        return releases
    }

    public enum Included: Codable, Sendable {
        case gameCenterDetail(GameCenterDetail)
        case gameCenterGroup(GameCenterGroup)
        case gameCenterLeaderboard(GameCenterLeaderboard)
        case gameCenterLeaderboardSet(GameCenterLeaderboardSet)
        case gameCenterLeaderboardSetLocalization(GameCenterLeaderboardSetLocalization)
        case gameCenterLeaderboardSetRelease(GameCenterLeaderboardSetRelease)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "gameCenterDetails":
                self = .gameCenterDetail(try GameCenterDetail(from: decoder))
            case "gameCenterGroups":
                self = .gameCenterGroup(try GameCenterGroup(from: decoder))
            case "gameCenterLeaderboards":
                self = .gameCenterLeaderboard(try GameCenterLeaderboard(from: decoder))
            case "gameCenterLeaderboardSets":
                self = .gameCenterLeaderboardSet(try GameCenterLeaderboardSet(from: decoder))
            case "gameCenterLeaderboardSetLocalizations":
                self = .gameCenterLeaderboardSetLocalization(try GameCenterLeaderboardSetLocalization(from: decoder))
            case "gameCenterLeaderboardSetReleases":
                self = .gameCenterLeaderboardSetRelease(try GameCenterLeaderboardSetRelease(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterGroup(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboard(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSet(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSetLocalization(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSetRelease(value):
                try value.encode(to: encoder)
            }
        }
    }
}
