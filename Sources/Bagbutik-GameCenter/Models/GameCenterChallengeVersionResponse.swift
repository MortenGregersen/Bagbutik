import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterChallengeVersionResponse
 A response containing a single version of a Game Center challenge.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterchallengeversionresponse>
 */
public struct GameCenterChallengeVersionResponse: Codable, Sendable {
    public let data: GameCenterChallengeVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterChallengeVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterChallengeVersion.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getChallenge() -> GameCenterChallenge? {
        included?.compactMap { relationship -> GameCenterChallenge? in
            guard case let .gameCenterChallenge(challenge) = relationship else { return nil }
            return challenge
        }.first { $0.id == data.relationships?.challenge?.data?.id }
    }

    public func getDefaultImage() -> GameCenterChallengeImage? {
        included?.compactMap { relationship -> GameCenterChallengeImage? in
            guard case let .gameCenterChallengeImage(defaultImage) = relationship else { return nil }
            return defaultImage
        }.first { $0.id == data.relationships?.defaultImage?.data?.id }
    }

    public func getLocalizations() -> [GameCenterChallengeLocalization] {
        guard let localizationIds = data.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> GameCenterChallengeLocalization? in
                  guard case let .gameCenterChallengeLocalization(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public func getReleases() -> [GameCenterChallengeVersionRelease] {
        guard let releaseIds = data.relationships?.releases?.data?.map(\.id),
              let releases = included?.compactMap({ relationship -> GameCenterChallengeVersionRelease? in
                  guard case let .gameCenterChallengeVersionRelease(release) = relationship else { return nil }
                  return releaseIds.contains(release.id) ? release : nil
              })
        else {
            return []
        }
        return releases
    }

    public enum Included: Codable, Sendable {
        case gameCenterChallenge(GameCenterChallenge)
        case gameCenterChallengeImage(GameCenterChallengeImage)
        case gameCenterChallengeLocalization(GameCenterChallengeLocalization)
        case gameCenterChallengeVersionRelease(GameCenterChallengeVersionRelease)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "gameCenterChallenges":
                self = .gameCenterChallenge(try GameCenterChallenge(from: decoder))
            case "gameCenterChallengeImages":
                self = .gameCenterChallengeImage(try GameCenterChallengeImage(from: decoder))
            case "gameCenterChallengeLocalizations":
                self = .gameCenterChallengeLocalization(try GameCenterChallengeLocalization(from: decoder))
            case "gameCenterChallengeVersionReleases":
                self = .gameCenterChallengeVersionRelease(try GameCenterChallengeVersionRelease(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterChallenge(value):
                try value.encode(to: encoder)
            case let .gameCenterChallengeImage(value):
                try value.encode(to: encoder)
            case let .gameCenterChallengeLocalization(value):
                try value.encode(to: encoder)
            case let .gameCenterChallengeVersionRelease(value):
                try value.encode(to: encoder)
            }
        }
    }
}
