import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivityVersionResponse
 A response containing a single version of a Game Center activity.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivityversionresponse>
 */
public struct GameCenterActivityVersionResponse: Codable, Sendable {
    public let data: GameCenterActivityVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterActivityVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterActivityVersion.self, forKey: "data")
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

    public func getDefaultImage() -> GameCenterActivityImage? {
        included?.compactMap { relationship -> GameCenterActivityImage? in
            guard case let .gameCenterActivityImage(defaultImage) = relationship else { return nil }
            return defaultImage
        }.first { $0.id == data.relationships?.defaultImage?.data?.id }
    }

    public func getLocalizations() -> [GameCenterActivityLocalization] {
        guard let localizationIds = data.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> GameCenterActivityLocalization? in
                  guard case let .gameCenterActivityLocalization(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public func getReleases() -> [GameCenterActivityVersionRelease] {
        guard let releaseIds = data.relationships?.releases?.data?.map(\.id),
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
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "gameCenterActivities":
                self = .gameCenterActivity(try GameCenterActivity(from: decoder))
            case "gameCenterActivityImages":
                self = .gameCenterActivityImage(try GameCenterActivityImage(from: decoder))
            case "gameCenterActivityLocalizations":
                self = .gameCenterActivityLocalization(try GameCenterActivityLocalization(from: decoder))
            case "gameCenterActivityVersionReleases":
                self = .gameCenterActivityVersionRelease(try GameCenterActivityVersionRelease(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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
