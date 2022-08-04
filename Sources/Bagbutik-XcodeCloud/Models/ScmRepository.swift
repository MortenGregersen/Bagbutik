import Foundation
import Bagbutik_Core

/**
 # ScmRepository
 The data structure that represents a Repositories resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmrepository>
 */
public struct ScmRepository: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Repositories resource.
    public let id: String
    /// The navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "scmRepositories" }
    /// The attributes that describe the Repositories resource.
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
     # ScmRepository.Attributes
     The attributes that describe a Repositories resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/scmrepository/attributes>
     */
    public struct Attributes: Codable {
        /// The Git repository’s URL for cloning it using HTTP.
        public var httpCloneUrl: String?
        /// The date and time when Xcode Cloud last accessed the repository.
        public var lastAccessedDate: Date?
        /// The name of the Git repository’s owner.
        public var ownerName: String?
        /// The name of the Git repository.
        public var repositoryName: String?
        /// The Git repository’s URL for cloning it using SSH.
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
    }

    /**
     # ScmRepository.Relationships
     The relationships of the Repositories resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/scmrepository/relationships>
     */
    public struct Relationships: Codable {
        /// The Git repository’s default branch.
        public var defaultBranch: DefaultBranch?
        /// The related Providers resource.
        public var scmProvider: ScmProvider?

        public init(defaultBranch: DefaultBranch? = nil,
                    scmProvider: ScmProvider? = nil)
        {
            self.defaultBranch = defaultBranch
            self.scmProvider = scmProvider
        }

        /**
         # ScmRepository.Relationships.DefaultBranch
         The data and links that describe the relationship between the Repositories resource and the Git References resource that represents the default branch.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/scmrepository/relationships/defaultbranch>
         */
        public struct DefaultBranch: Codable {
            /// The ID and type of the related Git References resource that represents the default branch.
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
             # ScmRepository.Relationships.DefaultBranch.Data
             The type and ID of a related Git References resource that represents the repository’s default branch.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/scmrepository/relationships/defaultbranch/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Git References resource that represents the default branch.
                public let id: String
                /// The resource type.
                public var type: String { "scmGitReferences" }

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
             # ScmRepository.Relationships.DefaultBranch.Links
             The links to the related Git References resource that represents the default branch and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/scmrepository/relationships/defaultbranch/links>
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

        /**
         # ScmRepository.Relationships.ScmProvider
         The data and links that describe the relationship between the Repositories and the Source Code Management Provider resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/scmrepository/relationships/scmprovider>
         */
        public struct ScmProvider: Codable {
            /// The ID and type of the related Providers resource.
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
             # ScmRepository.Relationships.ScmProvider.Data
             The type and ID of a related Providers resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/scmrepository/relationships/scmprovider/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Providers resource.
                public let id: String
                /// The resource type.
                public var type: String { "scmProviders" }

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
             # ScmRepository.Relationships.ScmProvider.Links
             The links to the related Providers resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/scmrepository/relationships/scmprovider/links>
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
