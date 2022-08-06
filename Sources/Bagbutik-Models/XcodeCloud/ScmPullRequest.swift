import Bagbutik_Core
import Foundation

/**
 # ScmPullRequest
 The data structure that represents a Pull Requests resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest>
 */
public struct ScmPullRequest: Codable, Identifiable, RequestBody {
    /// The opaque resource ID that uniquely identifies a Pull Request resource.
    public let id: String
    /// The navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "scmPullRequests" }
    /// The attributes that describe the Pull Requests resource.
    public var attributes: Attributes?
    /// The navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    /**
     # ScmPullRequest.Attributes
     The attributes that describe a Pull Requests resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest/attributes>
     */
    public struct Attributes: Codable {
        /// The name of the pull request’s destination branch.
        public var destinationBranchName: String?
        /// The name of the pull request’s destination repository. If the pull request is not for a fork, this is the same value as the source repository name.
        public var destinationRepositoryName: String?
        /// The owner of the pull request’s destination repository.
        public var destinationRepositoryOwner: String?
        /// A Boolean value that indicates whether the pull request is open or closed.
        public var isClosed: Bool?
        /// A Boolean value that indicates whether the pull request is for a Git fork.
        public var isCrossRepository: Bool?
        /// The pull request number.
        public var number: Int?
        /// The name of the pull request’s source branch.
        public var sourceBranchName: String?
        /// The name of the pull request’s source repository.
        public var sourceRepositoryName: String?
        /// The owner of the pull request’s destination repository.
        public var sourceRepositoryOwner: String?
        /// The pull request’s title.
        public var title: String?
        /// The URL of the pull request.
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
    }

    /**
     # ScmPullRequest.Relationships
     The relationships of the Pull Requests resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest/relationships>
     */
    public struct Relationships: Codable {
        /// The related Repositories resource.
        public var repository: Repository?

        public init(repository: Repository? = nil) {
            self.repository = repository
        }

        /**
         # ScmPullRequest.Relationships.Repository
         The data and links that describe the relationship between the Pull Requests and the Repositories resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest/relationships/repository>
         */
        public struct Repository: Codable {
            /// The ID and type of the related Repositories resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            /**
             # ScmPullRequest.Relationships.Repository.Data
             The type and ID of a related Repositories resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest/relationships/repository/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Repositories resource.
                public let id: String
                /// The resource type.
                public var type: String { "scmRepositories" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    id = try container.decode(String.self, forKey: .id)
                    if try container.decode(String.self, forKey: .type) != type {
                        throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(id, forKey: .id)
                    try container.encode(type, forKey: .type)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            /**
             # ScmPullRequest.Relationships.Repository.Links
             The links to the related Repositories resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest/relationships/repository/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
