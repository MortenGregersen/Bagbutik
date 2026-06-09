import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaGroupsResponse
 The response body for endpoints that list TestFlight beta groups.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupsresponse>
 */
public struct BetaGroupsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BetaGroup

    /// The resource data.
    public let data: [BetaGroup]
    public var included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [BetaGroup],
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
        data = try container.decode([BetaGroup].self, forKey: "data")
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

    public func getApp(for betaGroup: BetaGroup) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == betaGroup.relationships?.app?.data?.id }
    }

    public func getBetaRecruitmentCriteria(for betaGroup: BetaGroup) -> BetaRecruitmentCriterion? {
        included?.compactMap { relationship -> BetaRecruitmentCriterion? in
            guard case let .betaRecruitmentCriterion(betaRecruitmentCriteria) = relationship else { return nil }
            return betaRecruitmentCriteria
        }.first { $0.id == betaGroup.relationships?.betaRecruitmentCriteria?.data?.id }
    }

    public func getBetaTesters(for betaGroup: BetaGroup) -> [BetaTester] {
        guard let betaTesterIds = betaGroup.relationships?.betaTesters?.data?.map(\.id),
              let betaTesters = included?.compactMap({ relationship -> BetaTester? in
                  guard case let .betaTester(betaTester) = relationship else { return nil }
                  return betaTesterIds.contains(betaTester.id) ? betaTester : nil
              })
        else {
            return []
        }
        return betaTesters
    }

    public func getBuilds(for betaGroup: BetaGroup) -> [Build] {
        guard let buildIds = betaGroup.relationships?.builds?.data?.map(\.id),
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
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "apps":
                self = .app(try App(from: decoder))
            case "betaRecruitmentCriteria":
                self = .betaRecruitmentCriterion(try BetaRecruitmentCriterion(from: decoder))
            case "betaTesters":
                self = .betaTester(try BetaTester(from: decoder))
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
