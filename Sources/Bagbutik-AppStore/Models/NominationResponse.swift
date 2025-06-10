import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # NominationResponse
 A response that contains a single featuring nomination resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/nominationresponse>
 */
public struct NominationResponse: Codable, Sendable {
    public let data: Nomination
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: Nomination,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Nomination.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getCreatedByActor() -> Actor? {
        included?.compactMap { relationship -> Actor? in
            guard case let .actor(createdByActor) = relationship else { return nil }
            return createdByActor
        }.first { $0.id == data.relationships?.createdByActor?.data?.id }
    }

    public func getInAppEvents() -> [AppEvent] {
        guard let inAppEventIds = data.relationships?.inAppEvents?.data?.map(\.id),
              let inAppEvents = included?.compactMap({ relationship -> AppEvent? in
                  guard case let .appEvent(inAppEvent) = relationship else { return nil }
                  return inAppEventIds.contains(inAppEvent.id) ? inAppEvent : nil
              })
        else {
            return []
        }
        return inAppEvents
    }

    public func getLastModifiedByActor() -> Actor? {
        included?.compactMap { relationship -> Actor? in
            guard case let .actor(lastModifiedByActor) = relationship else { return nil }
            return lastModifiedByActor
        }.first { $0.id == data.relationships?.lastModifiedByActor?.data?.id }
    }

    public func getRelatedApps() -> [App] {
        guard let relatedAppIds = data.relationships?.relatedApps?.data?.map(\.id),
              let relatedApps = included?.compactMap({ relationship -> App? in
                  guard case let .app(relatedApp) = relationship else { return nil }
                  return relatedAppIds.contains(relatedApp.id) ? relatedApp : nil
              })
        else {
            return []
        }
        return relatedApps
    }

    public func getSubmittedByActor() -> Actor? {
        included?.compactMap { relationship -> Actor? in
            guard case let .actor(submittedByActor) = relationship else { return nil }
            return submittedByActor
        }.first { $0.id == data.relationships?.submittedByActor?.data?.id }
    }

    public func getSupportedTerritories() -> [Territory] {
        guard let supportedTerritoryIds = data.relationships?.supportedTerritories?.data?.map(\.id),
              let supportedTerritories = included?.compactMap({ relationship -> Territory? in
                  guard case let .territory(supportedTerritory) = relationship else { return nil }
                  return supportedTerritoryIds.contains(supportedTerritory.id) ? supportedTerritory : nil
              })
        else {
            return []
        }
        return supportedTerritories
    }

    public enum Included: Codable, Sendable {
        case actor(Actor)
        case app(App)
        case appEvent(AppEvent)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let actor = try? Actor(from: decoder) {
                self = .actor(actor)
            } else if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appEvent = try? AppEvent(from: decoder) {
                self = .appEvent(appEvent)
            } else if let territory = try? Territory(from: decoder) {
                self = .territory(territory)
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
            case let .actor(value):
                try value.encode(to: encoder)
            case let .app(value):
                try value.encode(to: encoder)
            case let .appEvent(value):
                try value.encode(to: encoder)
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }
    }
}
