import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaTesterResponse
 The response body for endpoints that create, read, or modify a TestFlight beta tester.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatesterresponse>
 */
public struct BetaTesterResponse: Codable, Sendable {
    /// The resource data.
    public let data: BetaTester
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaTester,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaTester.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getApps() -> [App] {
        guard let appIds = data.relationships?.apps?.data?.map(\.id),
              let apps = included?.compactMap({ relationship -> App? in
                  guard case let .app(app) = relationship else { return nil }
                  return appIds.contains(app.id) ? app : nil
              })
        else {
            return []
        }
        return apps
    }

    public func getBetaGroups() -> [BetaGroup] {
        guard let betaGroupIds = data.relationships?.betaGroups?.data?.map(\.id),
              let betaGroups = included?.compactMap({ relationship -> BetaGroup? in
                  guard case let .betaGroup(betaGroup) = relationship else { return nil }
                  return betaGroupIds.contains(betaGroup.id) ? betaGroup : nil
              })
        else {
            return []
        }
        return betaGroups
    }

    public func getBuilds() -> [Build] {
        guard let buildIds = data.relationships?.builds?.data?.map(\.id),
              let builds = included?.compactMap({ relationship -> Build? in
                  guard case let .build(build) = relationship else { return nil }
                  return buildIds.contains(build.id) ? build : nil
              })
        else {
            return []
        }
        return builds
    }

    public enum Included: Codable, Sendable {
        case app(App)
        case betaGroup(BetaGroup)
        case build(Build)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "apps":
                self = .app(try App(from: decoder))
            case "betaGroups":
                self = .betaGroup(try BetaGroup(from: decoder))
            case "builds":
                self = .build(try Build(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .betaGroup(value):
                try value.encode(to: encoder)
            case let .build(value):
                try value.encode(to: encoder)
            }
        }
    }
}
