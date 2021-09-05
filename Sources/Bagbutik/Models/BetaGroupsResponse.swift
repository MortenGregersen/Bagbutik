import Foundation

/**
 A response that contains a list of Beta Group resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupsresponse>
 */
public struct BetaGroupsResponse: Codable, PagedResponse {
    public typealias Data = BetaGroup
    /// The resource data.
    public let data: [BetaGroup]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BetaGroup], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case app(App)
        case betaTesters(BetaTester)
        case builds(Build)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let betaTesters = try? BetaTester(from: decoder) {
                self = .betaTesters(betaTesters)
            } else if let builds = try? Build(from: decoder) {
                self = .builds(builds)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .betaTesters(value):
                try value.encode(to: encoder)
            case let .builds(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case app
            case betaTesters
            case builds
        }
    }
}
