import Bagbutik_Core
import Foundation

/**
 # BetaRecruitmentCriterionCompatibleBuildCheck
 The data structure that represents a beta recruitment criteria-compatible, build-check resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betarecruitmentcriterioncompatiblebuildcheck>
 */
public struct BetaRecruitmentCriterionCompatibleBuildCheck: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "betaRecruitmentCriterionCompatibleBuildChecks" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
        public var hasCompatibleBuild: Bool?

        public init(hasCompatibleBuild: Bool? = nil) {
            self.hasCompatibleBuild = hasCompatibleBuild
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            hasCompatibleBuild = try container.decodeIfPresent(Bool.self, forKey: "hasCompatibleBuild")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(hasCompatibleBuild, forKey: "hasCompatibleBuild")
        }
    }
}
