import Foundation

/**
 A response that contains a list of Beta Tester resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatestersresponse>
 */
public struct BetaTestersResponse: Codable {
    /// The resource data.
    public let data: [BetaTester]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BetaTester], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case apps(App)
        case betaGroups(BetaGroup)
        case builds(Build)

        public init(from decoder: Decoder) throws {
            if let apps = try? App(from: decoder) {
                self = .apps(apps)
            } else if let betaGroups = try? BetaGroup(from: decoder) {
                self = .betaGroups(betaGroups)
            } else if let builds = try? Build(from: decoder) {
                self = .builds(builds)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .apps(value):
                try value.encode(to: encoder)
            case let .betaGroups(value):
                try value.encode(to: encoder)
            case let .builds(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case apps
            case betaGroups
            case builds
        }
    }
}
