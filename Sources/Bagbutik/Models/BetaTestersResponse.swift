import Foundation

/**
 A response that contains a list of Beta Tester resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatestersresponse>
 */
public struct BetaTestersResponse: Codable, PagedResponse {
    public typealias Data = BetaTester
    /// The resource data.
    public let data: [BetaTester]
    /// The included related resources.
    @NullCodable public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [BetaTester], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getApps(for betaTester: BetaTester) -> [App] {
        guard let appIds = betaTester.relationships?.apps?.data?.map(\.id),
              let apps = included?.compactMap({ relationship -> App? in
                  guard case let .app(app) = relationship else { return nil }
                  return appIds.contains(app.id) ? app : nil
              })
        else {
            return []
        }
        return apps
    }

    public func getBetaGroups(for betaTester: BetaTester) -> [BetaGroup] {
        guard let betaGroupIds = betaTester.relationships?.betaGroups?.data?.map(\.id),
              let betaGroups = included?.compactMap({ relationship -> BetaGroup? in
                  guard case let .betaGroup(betaGroup) = relationship else { return nil }
                  return betaGroupIds.contains(betaGroup.id) ? betaGroup : nil
              })
        else {
            return []
        }
        return betaGroups
    }

    public func getBuilds(for betaTester: BetaTester) -> [Build] {
        guard let buildIds = betaTester.relationships?.builds?.data?.map(\.id),
              let builds = included?.compactMap({ relationship -> Build? in
                  guard case let .build(build) = relationship else { return nil }
                  return buildIds.contains(build.id) ? build : nil
              })
        else {
            return []
        }
        return builds
    }

    public enum Included: Codable {
        case app(App)
        case betaGroup(BetaGroup)
        case build(Build)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let betaGroup = try? BetaGroup(from: decoder) {
                self = .betaGroup(betaGroup)
            } else if let build = try? Build(from: decoder) {
                self = .build(build)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
