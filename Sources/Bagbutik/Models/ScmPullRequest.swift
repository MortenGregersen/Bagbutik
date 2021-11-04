import Foundation

/**
 The data structure that represents a Pull Requests resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest>
 */
public struct ScmPullRequest: Codable, RequestBody {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "scmPullRequests" }
    /// The resource's attributes.
    public let attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    /**
     The attributes that describe a Pull Requests resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest/attributes>
     */
    public struct Attributes: Codable {
        /// The name of the pull request’s destination branch.
        public let destinationBranchName: String?
        /// The name of the pull request’s destination repository. If the pull request is not for a fork, this is the same value as the source repository name.
        public let destinationRepositoryName: String?
        /// The owner of the pull request’s destination repository.
        public let destinationRepositoryOwner: String?
        /// A Boolean value that indicates whether the pull request is open or closed.
        public let isClosed: Bool?
        /// A Boolean value that indicates whether the pull request is for a Git fork.
        public let isCrossRepository: Bool?
        /// The pull request number.
        public let number: Int?
        /// The name of the pull request’s source branch.
        public let sourceBranchName: String?
        /// The name of the pull request’s source repository.
        public let sourceRepositoryName: String?
        /// The owner of the pull request’s destination repository.
        public let sourceRepositoryOwner: String?
        /// The pull request’s title.
        public let title: String?
        /// The URL of the pull request.
        public let webUrl: String?

        public init(destinationBranchName: String? = nil, destinationRepositoryName: String? = nil, destinationRepositoryOwner: String? = nil, isClosed: Bool? = nil, isCrossRepository: Bool? = nil, number: Int? = nil, sourceBranchName: String? = nil, sourceRepositoryName: String? = nil, sourceRepositoryOwner: String? = nil, title: String? = nil, webUrl: String? = nil) {
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
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest/relationships>
     */
    public struct Relationships: Codable {
        public let repository: Repository?

        public init(repository: Repository? = nil) {
            self.repository = repository
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest/relationships/repository>
         */
        public struct Repository: Codable {
            /// The type and ID of a related resource.
            public let data: Data?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest/relationships/repository/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "scmRepositories" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/scmpullrequest/relationships/repository/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
