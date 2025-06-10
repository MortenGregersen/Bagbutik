import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivityVersionsResponse
 A response that contains a list of activity version resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivityversionsresponse>
 */
public struct GameCenterActivityVersionsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterActivityVersion

    public let data: [GameCenterActivityVersion]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterActivityVersion],
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
        data = try container.decode([GameCenterActivityVersion].self, forKey: "data")
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

    public func getActivity(for gameCenterActivityVersion: GameCenterActivityVersion) -> GameCenterActivity? {
        included?.compactMap { relationship -> GameCenterActivity? in
            guard case let .gameCenterActivity(activity) = relationship else { return nil }
            return activity
        }.first { $0.id == gameCenterActivityVersion.relationships?.activity?.data?.id }
    }

    public func getDefaultImage(for gameCenterActivityVersion: GameCenterActivityVersion) -> GameCenterActivityImage? {
        included?.compactMap { relationship -> GameCenterActivityImage? in
            guard case let .gameCenterActivityImage(defaultImage) = relationship else { return nil }
            return defaultImage
        }.first { $0.id == gameCenterActivityVersion.relationships?.defaultImage?.data?.id }
    }

    public func getLocalizations(for gameCenterActivityVersion: GameCenterActivityVersion) -> [GameCenterActivityLocalization] {
        guard let localizationIds = gameCenterActivityVersion.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> GameCenterActivityLocalization? in
                  guard case let .gameCenterActivityLocalization(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public func getReleases(for gameCenterActivityVersion: GameCenterActivityVersion) -> [GameCenterActivityVersionRelease] {
        guard let releaseIds = gameCenterActivityVersion.relationships?.releases?.data?.map(\.id),
              let releases = included?.compactMap({ relationship -> GameCenterActivityVersionRelease? in
                  guard case let .gameCenterActivityVersionRelease(release) = relationship else { return nil }
                  return releaseIds.contains(release.id) ? release : nil
              })
        else {
            return []
        }
        return releases
    }

    public enum Included: Codable, Sendable {
        case gameCenterActivity(GameCenterActivity)
        case gameCenterActivityImage(GameCenterActivityImage)
        case gameCenterActivityLocalization(GameCenterActivityLocalization)
        case gameCenterActivityVersionRelease(GameCenterActivityVersionRelease)

        public init(from decoder: Decoder) throws {
            if let gameCenterActivity = try? GameCenterActivity(from: decoder) {
                self = .gameCenterActivity(gameCenterActivity)
            } else if let gameCenterActivityImage = try? GameCenterActivityImage(from: decoder) {
                self = .gameCenterActivityImage(gameCenterActivityImage)
            } else if let gameCenterActivityLocalization = try? GameCenterActivityLocalization(from: decoder) {
                self = .gameCenterActivityLocalization(gameCenterActivityLocalization)
            } else if let gameCenterActivityVersionRelease = try? GameCenterActivityVersionRelease(from: decoder) {
                self = .gameCenterActivityVersionRelease(gameCenterActivityVersionRelease)
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
            case let .gameCenterActivity(value):
                try value.encode(to: encoder)
            case let .gameCenterActivityImage(value):
                try value.encode(to: encoder)
            case let .gameCenterActivityLocalization(value):
                try value.encode(to: encoder)
            case let .gameCenterActivityVersionRelease(value):
                try value.encode(to: encoder)
            }
        }
    }
}
