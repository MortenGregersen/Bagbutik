import Bagbutik_Core
import Foundation

/**
 # ScmGitReference
 The data structure that represents a Git References resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmgitreference>
 */
public struct ScmGitReference: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Git References resource.
    public let id: String
    /// The navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "scmGitReferences" }
    /// The attributes that describe the Git References resource.
    public var attributes: Attributes?
    /// The navigational links to related data and included resource types and IDs.
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
        public var canonicalName: String?
        public var isDeleted: Bool?
        public var kind: CiGitRefKind?
        public var name: String?

        public init(canonicalName: String? = nil,
                    isDeleted: Bool? = nil,
                    kind: CiGitRefKind? = nil,
                    name: String? = nil)
        {
            self.canonicalName = canonicalName
            self.isDeleted = isDeleted
            self.kind = kind
            self.name = name
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            canonicalName = try container.decodeIfPresent(String.self, forKey: "canonicalName")
            isDeleted = try container.decodeIfPresent(Bool.self, forKey: "isDeleted")
            kind = try container.decodeIfPresent(CiGitRefKind.self, forKey: "kind")
            name = try container.decodeIfPresent(String.self, forKey: "name")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(canonicalName, forKey: "canonicalName")
            try container.encodeIfPresent(isDeleted, forKey: "isDeleted")
            try container.encodeIfPresent(kind, forKey: "kind")
            try container.encodeIfPresent(name, forKey: "name")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var repository: Repository?

        public init(repository: Repository? = nil) {
            self.repository = repository
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            repository = try container.decodeIfPresent(Repository.self, forKey: "repository")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(repository, forKey: "repository")
        }

        public struct Repository: Codable, Sendable {
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
                public var type: String { "scmRepositories" }

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
