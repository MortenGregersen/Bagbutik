import BagbutikCore
import Foundation

public struct RetentionMessageVersionResponse: Codable, Sendable {
    public let data: RetentionMessageVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: RetentionMessageVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(RetentionMessageVersion.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getLocalizations() -> [RetentionMessageLocalization] {
        guard let localizationIds = data.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> RetentionMessageLocalization? in
                  guard case let .retentionMessageLocalization(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public func getPlacement() -> AppAssetLibraryPlacement? {
        included?.compactMap { relationship -> AppAssetLibraryPlacement? in
            guard case let .appAssetLibraryPlacement(placement) = relationship else { return nil }
            return placement
        }.first { $0.id == data.relationships?.placement?.data?.id }
    }

    public func getRetentionMessage() -> RetentionMessage? {
        included?.compactMap { relationship -> RetentionMessage? in
            guard case let .retentionMessage(retentionMessage) = relationship else { return nil }
            return retentionMessage
        }.first { $0.id == data.relationships?.retentionMessage?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case appAssetLibraryPlacement(AppAssetLibraryPlacement)
        case retentionMessage(RetentionMessage)
        case retentionMessageLocalization(RetentionMessageLocalization)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "appAssetLibraryPlacements":
                self = .appAssetLibraryPlacement(try AppAssetLibraryPlacement(from: decoder))
            case "retentionMessages":
                self = .retentionMessage(try RetentionMessage(from: decoder))
            case "retentionMessageLocalizations":
                self = .retentionMessageLocalization(try RetentionMessageLocalization(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appAssetLibraryPlacement(value):
                try value.encode(to: encoder)
            case let .retentionMessage(value):
                try value.encode(to: encoder)
            case let .retentionMessageLocalization(value):
                try value.encode(to: encoder)
            }
        }
    }
}
