import Bagbutik_Core
import Foundation

/**
 # ScmPullRequest
 The data structure that represents a Pull Requests resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest>
 */
public struct ScmPullRequest: Codable, Sendable, Identifiable, RequestBody {
    /// The opaque resource ID that uniquely identifies a Pull Request resource.
    public let id: String
    /// The navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "scmPullRequests" }
    /// The attributes that describe the Pull Requests resource.
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
        public var destinationBranchName: String?
        public var destinationRepositoryName: String?
        public var destinationRepositoryOwner: String?
        public var isClosed: Bool?
        public var isCrossRepository: Bool?
        public var number: Int?
        public var sourceBranchName: String?
        public var sourceRepositoryName: String?
        public var sourceRepositoryOwner: String?
        public var title: String?
        public var webUrl: String?

        public init(destinationBranchName: String? = nil,
                    destinationRepositoryName: String? = nil,
                    destinationRepositoryOwner: String? = nil,
                    isClosed: Bool? = nil,
                    isCrossRepository: Bool? = nil,
                    number: Int? = nil,
                    sourceBranchName: String? = nil,
                    sourceRepositoryName: String? = nil,
                    sourceRepositoryOwner: String? = nil,
                    title: String? = nil,
                    webUrl: String? = nil)
        {
            self.destinationBranchName = destinationBranchName
            self.destinationRepositoryName = destinationRepositoryName
            self.destinationRepositoryOwner = destinationRepositoryOwner
            self.isClosed = isClosed
            self.isCrossRepository = isCrossRepository
            self.number = number
            self.sourceBranchName = sourceBranchName
            self.sourceRepositoryName = sourceRepositoryName
            self.sourceRepositoryOwner = sourceRepositoryOwner
            self.title = title
            self.webUrl = webUrl
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            destinationBranchName = try container.decodeIfPresent(String.self, forKey: "destinationBranchName")
            destinationRepositoryName = try container.decodeIfPresent(String.self, forKey: "destinationRepositoryName")
            destinationRepositoryOwner = try container.decodeIfPresent(String.self, forKey: "destinationRepositoryOwner")
            isClosed = try container.decodeIfPresent(Bool.self, forKey: "isClosed")
            isCrossRepository = try container.decodeIfPresent(Bool.self, forKey: "isCrossRepository")
            number = try container.decodeIfPresent(Int.self, forKey: "number")
            sourceBranchName = try container.decodeIfPresent(String.self, forKey: "sourceBranchName")
            sourceRepositoryName = try container.decodeIfPresent(String.self, forKey: "sourceRepositoryName")
            sourceRepositoryOwner = try container.decodeIfPresent(String.self, forKey: "sourceRepositoryOwner")
            title = try container.decodeIfPresent(String.self, forKey: "title")
            webUrl = try container.decodeIfPresent(String.self, forKey: "webUrl")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(destinationBranchName, forKey: "destinationBranchName")
            try container.encodeIfPresent(destinationRepositoryName, forKey: "destinationRepositoryName")
            try container.encodeIfPresent(destinationRepositoryOwner, forKey: "destinationRepositoryOwner")
            try container.encodeIfPresent(isClosed, forKey: "isClosed")
            try container.encodeIfPresent(isCrossRepository, forKey: "isCrossRepository")
            try container.encodeIfPresent(number, forKey: "number")
            try container.encodeIfPresent(sourceBranchName, forKey: "sourceBranchName")
            try container.encodeIfPresent(sourceRepositoryName, forKey: "sourceRepositoryName")
            try container.encodeIfPresent(sourceRepositoryOwner, forKey: "sourceRepositoryOwner")
            try container.encodeIfPresent(title, forKey: "title")
            try container.encodeIfPresent(webUrl, forKey: "webUrl")
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
