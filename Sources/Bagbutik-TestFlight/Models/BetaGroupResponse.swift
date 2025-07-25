import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaGroupResponse
 A response that contains a single Beta Groups resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupresponse>
 */
public struct BetaGroupResponse: Codable, Sendable {
    /// The resource data.
    public let data: BetaGroup
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaGroup,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaGroup.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getBetaRecruitmentCriteria() -> BetaRecruitmentCriterion? {
        included?.compactMap { relationship -> BetaRecruitmentCriterion? in
            guard case let .betaRecruitmentCriterion(betaRecruitmentCriteria) = relationship else { return nil }
            return betaRecruitmentCriteria
        }.first { $0.id == data.relationships?.betaRecruitmentCriteria?.data?.id }
    }

    public func getBetaTesters() -> [BetaTester] {
        guard let betaTesterIds = data.relationships?.betaTesters?.data?.map(\.id),
              let betaTesters = included?.compactMap({ relationship -> BetaTester? in
                  guard case let .betaTester(betaTester) = relationship else { return nil }
                  return betaTesterIds.contains(betaTester.id) ? betaTester : nil
              })
        else {
            return []
        }
        return betaTesters
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
        case betaRecruitmentCriterion(BetaRecruitmentCriterion)
        case betaTester(BetaTester)
        case build(Build)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let betaRecruitmentCriterion = try? BetaRecruitmentCriterion(from: decoder) {
                self = .betaRecruitmentCriterion(betaRecruitmentCriterion)
            } else if let betaTester = try? BetaTester(from: decoder) {
                self = .betaTester(betaTester)
            } else if let build = try? Build(from: decoder) {
                self = .build(build)
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
            case let .app(value):
                try value.encode(to: encoder)
            case let .betaRecruitmentCriterion(value):
                try value.encode(to: encoder)
            case let .betaTester(value):
                try value.encode(to: encoder)
            case let .build(value):
                try value.encode(to: encoder)
            }
        }
    }
}
