import Bagbutik_Core
import Foundation

public struct ScmRepository: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "scmRepositories" }
    public var attributes: Attributes?
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
        public var httpCloneUrl: String?
        public var lastAccessedDate: Date?
        public var ownerName: String?
        public var repositoryName: String?
        public var sshCloneUrl: String?

        public init(httpCloneUrl: String? = nil,
                    lastAccessedDate: Date? = nil,
                    ownerName: String? = nil,
                    repositoryName: String? = nil,
                    sshCloneUrl: String? = nil)
        {
            self.httpCloneUrl = httpCloneUrl
            self.lastAccessedDate = lastAccessedDate
            self.ownerName = ownerName
            self.repositoryName = repositoryName
            self.sshCloneUrl = sshCloneUrl
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            httpCloneUrl = try container.decodeIfPresent(String.self, forKey: "httpCloneUrl")
            lastAccessedDate = try container.decodeIfPresent(Date.self, forKey: "lastAccessedDate")
            ownerName = try container.decodeIfPresent(String.self, forKey: "ownerName")
            repositoryName = try container.decodeIfPresent(String.self, forKey: "repositoryName")
            sshCloneUrl = try container.decodeIfPresent(String.self, forKey: "sshCloneUrl")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(httpCloneUrl, forKey: "httpCloneUrl")
            try container.encodeIfPresent(lastAccessedDate, forKey: "lastAccessedDate")
            try container.encodeIfPresent(ownerName, forKey: "ownerName")
            try container.encodeIfPresent(repositoryName, forKey: "repositoryName")
            try container.encodeIfPresent(sshCloneUrl, forKey: "sshCloneUrl")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var defaultBranch: DefaultBranch?
        public var gitReferences: GitReferences?
        public var pullRequests: PullRequests?
        public var scmProvider: ScmProvider?

        public init(defaultBranch: DefaultBranch? = nil,
                    gitReferences: GitReferences? = nil,
                    pullRequests: PullRequests? = nil,
                    scmProvider: ScmProvider? = nil)
        {
            self.defaultBranch = defaultBranch
            self.gitReferences = gitReferences
            self.pullRequests = pullRequests
            self.scmProvider = scmProvider
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            defaultBranch = try container.decodeIfPresent(DefaultBranch.self, forKey: "defaultBranch")
            gitReferences = try container.decodeIfPresent(GitReferences.self, forKey: "gitReferences")
            pullRequests = try container.decodeIfPresent(PullRequests.self, forKey: "pullRequests")
            scmProvider = try container.decodeIfPresent(ScmProvider.self, forKey: "scmProvider")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(defaultBranch, forKey: "defaultBranch")
            try container.encodeIfPresent(gitReferences, forKey: "gitReferences")
            try container.encodeIfPresent(pullRequests, forKey: "pullRequests")
            try container.encodeIfPresent(scmProvider, forKey: "scmProvider")
        }

        public struct DefaultBranch: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "scmGitReferences" }

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

        public struct GitReferences: Codable, Sendable {
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

        public struct PullRequests: Codable, Sendable {
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

        public struct ScmProvider: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "scmProviders" }

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
