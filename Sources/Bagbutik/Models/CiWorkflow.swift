import Foundation

/**
 The data structure that represents a Workflows resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow>
 */
public struct CiWorkflow: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "ciWorkflows" }
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

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
        case attributes
        case relationships
    }

    /**
     The attributes that describe a Workflows resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/attributes>
     */
    public struct Attributes: Codable {
        /// The actions that are part of the workflow.
        public let actions: [CiAction]?
        /// The workflow’s start condition that starts new builds for changes to a branch.
        public let branchStartCondition: CiBranchStartCondition?
        /// A Boolean value that indicates whether Xcode Cloud should perform a clean build.
        public let clean: Bool?
        /// The relative path to your Xcode project or workspace.
        public let containerFilePath: String?
        /// The workflow’s description.
        public let description: String?
        /// A Boolean value that indicates whether the workflow is active or deactivated.
        public let isEnabled: Bool?
        /// A Boolean value that indicates whether edits to the workflow are restricted.
        public let isLockedForEditing: Bool?
        /// The date and time when the workflow was last modified.
        public let lastModifiedDate: Date?
        /// The name of the Xcode Cloud workflow; for example, My Workflow.
        public let name: String?
        /// The workflow’s start condition for pull request changes.
        public let pullRequestStartCondition: CiPullRequestStartCondition?
        /// The workflow’s start condition that starts new builds on a custom schedule.
        public let scheduledStartCondition: CiScheduledStartCondition?
        /// The workflow’s start condition that starts new builds for changes to a tag.
        public let tagStartCondition: CiTagStartCondition?

        public init(actions: [CiAction]? = nil, branchStartCondition: CiBranchStartCondition? = nil, clean: Bool? = nil, containerFilePath: String? = nil, description: String? = nil, isEnabled: Bool? = nil, isLockedForEditing: Bool? = nil, lastModifiedDate: Date? = nil, name: String? = nil, pullRequestStartCondition: CiPullRequestStartCondition? = nil, scheduledStartCondition: CiScheduledStartCondition? = nil, tagStartCondition: CiTagStartCondition? = nil) {
            self.actions = actions
            self.branchStartCondition = branchStartCondition
            self.clean = clean
            self.containerFilePath = containerFilePath
            self.description = description
            self.isEnabled = isEnabled
            self.isLockedForEditing = isLockedForEditing
            self.lastModifiedDate = lastModifiedDate
            self.name = name
            self.pullRequestStartCondition = pullRequestStartCondition
            self.scheduledStartCondition = scheduledStartCondition
            self.tagStartCondition = tagStartCondition
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships>
     */
    public struct Relationships: Codable {
        public let macOsVersion: MacOsVersion?
        public let product: Product?
        public let repository: Repository?
        public let xcodeVersion: XcodeVersion?

        public init(macOsVersion: MacOsVersion? = nil, product: Product? = nil, repository: Repository? = nil, xcodeVersion: XcodeVersion? = nil) {
            self.macOsVersion = macOsVersion
            self.product = product
            self.repository = repository
            self.xcodeVersion = xcodeVersion
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/macosversion>
         */
        public struct MacOsVersion: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/macosversion/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "ciMacOsVersions" }

                public init(id: String) {
                    self.id = id
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
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/macosversion/links>
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

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/product>
         */
        public struct Product: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/product/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "ciProducts" }

                public init(id: String) {
                    self.id = id
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
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/product/links>
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

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/repository>
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
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/repository/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "scmRepositories" }

                public init(id: String) {
                    self.id = id
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
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/repository/links>
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

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/xcodeversion>
         */
        public struct XcodeVersion: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/xcodeversion/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "ciXcodeVersions" }

                public init(id: String) {
                    self.id = id
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
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/xcodeversion/links>
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
