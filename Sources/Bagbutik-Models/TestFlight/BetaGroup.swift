import Bagbutik_Core
import Foundation

/**
 # BetaGroup
 The data structure that represents a Beta Groups resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betagroup>
 */
public struct BetaGroup: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "betaGroups" }
    /// The resource’s attributes.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
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
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var createdDate: Date?
        public var feedbackEnabled: Bool?
        public var hasAccessToAllBuilds: Bool?
        public var iosBuildsAvailableForAppleSiliconMac: Bool?
        public var iosBuildsAvailableForAppleVision: Bool?
        public var isInternalGroup: Bool?
        public var name: String?
        public var publicLink: String?
        public var publicLinkEnabled: Bool?
        public var publicLinkId: String?
        public var publicLinkLimit: Int?
        public var publicLinkLimitEnabled: Bool?

        public init(createdDate: Date? = nil,
                    feedbackEnabled: Bool? = nil,
                    hasAccessToAllBuilds: Bool? = nil,
                    iosBuildsAvailableForAppleSiliconMac: Bool? = nil,
                    iosBuildsAvailableForAppleVision: Bool? = nil,
                    isInternalGroup: Bool? = nil,
                    name: String? = nil,
                    publicLink: String? = nil,
                    publicLinkEnabled: Bool? = nil,
                    publicLinkId: String? = nil,
                    publicLinkLimit: Int? = nil,
                    publicLinkLimitEnabled: Bool? = nil)
        {
            self.createdDate = createdDate
            self.feedbackEnabled = feedbackEnabled
            self.hasAccessToAllBuilds = hasAccessToAllBuilds
            self.iosBuildsAvailableForAppleSiliconMac = iosBuildsAvailableForAppleSiliconMac
            self.iosBuildsAvailableForAppleVision = iosBuildsAvailableForAppleVision
            self.isInternalGroup = isInternalGroup
            self.name = name
            self.publicLink = publicLink
            self.publicLinkEnabled = publicLinkEnabled
            self.publicLinkId = publicLinkId
            self.publicLinkLimit = publicLinkLimit
            self.publicLinkLimitEnabled = publicLinkLimitEnabled
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            feedbackEnabled = try container.decodeIfPresent(Bool.self, forKey: "feedbackEnabled")
            hasAccessToAllBuilds = try container.decodeIfPresent(Bool.self, forKey: "hasAccessToAllBuilds")
            iosBuildsAvailableForAppleSiliconMac = try container.decodeIfPresent(Bool.self, forKey: "iosBuildsAvailableForAppleSiliconMac")
            iosBuildsAvailableForAppleVision = try container.decodeIfPresent(Bool.self, forKey: "iosBuildsAvailableForAppleVision")
            isInternalGroup = try container.decodeIfPresent(Bool.self, forKey: "isInternalGroup")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            publicLink = try container.decodeIfPresent(String.self, forKey: "publicLink")
            publicLinkEnabled = try container.decodeIfPresent(Bool.self, forKey: "publicLinkEnabled")
            publicLinkId = try container.decodeIfPresent(String.self, forKey: "publicLinkId")
            publicLinkLimit = try container.decodeIfPresent(Int.self, forKey: "publicLinkLimit")
            publicLinkLimitEnabled = try container.decodeIfPresent(Bool.self, forKey: "publicLinkLimitEnabled")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(feedbackEnabled, forKey: "feedbackEnabled")
            try container.encodeIfPresent(hasAccessToAllBuilds, forKey: "hasAccessToAllBuilds")
            try container.encodeIfPresent(iosBuildsAvailableForAppleSiliconMac, forKey: "iosBuildsAvailableForAppleSiliconMac")
            try container.encodeIfPresent(iosBuildsAvailableForAppleVision, forKey: "iosBuildsAvailableForAppleVision")
            try container.encodeIfPresent(isInternalGroup, forKey: "isInternalGroup")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(publicLink, forKey: "publicLink")
            try container.encodeIfPresent(publicLinkEnabled, forKey: "publicLinkEnabled")
            try container.encodeIfPresent(publicLinkId, forKey: "publicLinkId")
            try container.encodeIfPresent(publicLinkLimit, forKey: "publicLinkLimit")
            try container.encodeIfPresent(publicLinkLimitEnabled, forKey: "publicLinkLimitEnabled")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var app: App?
        public var betaRecruitmentCriteria: BetaRecruitmentCriteria?
        public var betaRecruitmentCriterionCompatibleBuildCheck: BetaRecruitmentCriterionCompatibleBuildCheck?
        public var betaTesters: BetaTesters?
        public var builds: Builds?

        public init(app: App? = nil,
                    betaRecruitmentCriteria: BetaRecruitmentCriteria? = nil,
                    betaRecruitmentCriterionCompatibleBuildCheck: BetaRecruitmentCriterionCompatibleBuildCheck? = nil,
                    betaTesters: BetaTesters? = nil,
                    builds: Builds? = nil)
        {
            self.app = app
            self.betaRecruitmentCriteria = betaRecruitmentCriteria
            self.betaRecruitmentCriterionCompatibleBuildCheck = betaRecruitmentCriterionCompatibleBuildCheck
            self.betaTesters = betaTesters
            self.builds = builds
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            app = try container.decodeIfPresent(App.self, forKey: "app")
            betaRecruitmentCriteria = try container.decodeIfPresent(BetaRecruitmentCriteria.self, forKey: "betaRecruitmentCriteria")
            betaRecruitmentCriterionCompatibleBuildCheck = try container.decodeIfPresent(BetaRecruitmentCriterionCompatibleBuildCheck.self, forKey: "betaRecruitmentCriterionCompatibleBuildCheck")
            betaTesters = try container.decodeIfPresent(BetaTesters.self, forKey: "betaTesters")
            builds = try container.decodeIfPresent(Builds.self, forKey: "builds")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(app, forKey: "app")
            try container.encodeIfPresent(betaRecruitmentCriteria, forKey: "betaRecruitmentCriteria")
            try container.encodeIfPresent(betaRecruitmentCriterionCompatibleBuildCheck, forKey: "betaRecruitmentCriterionCompatibleBuildCheck")
            try container.encodeIfPresent(betaTesters, forKey: "betaTesters")
            try container.encodeIfPresent(builds, forKey: "builds")
        }

        public struct App: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "apps" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }

        public struct BetaRecruitmentCriteria: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "betaRecruitmentCriteria" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }

        public struct BetaRecruitmentCriterionCompatibleBuildCheck: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }

        public struct BetaTesters: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "betaTesters" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }

        public struct Builds: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "builds" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }
    }
}
