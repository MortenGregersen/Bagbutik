import Bagbutik_Core
import Foundation

/**
 # CiWorkflow
 The data structure that represents a Workflows resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow>
 */
public struct CiWorkflow: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Workflows resource.
    public let id: String
    /// The navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "ciWorkflows" }
    /// The attributes that describe the Workflows resource.
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

    /**
     # CiWorkflow.Attributes
     The attributes that describe a Workflows resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/attributes>
     */
    public struct Attributes: Codable, Sendable {
        /// The actions that are part of the workflow.
        public var actions: [CiAction]?
        /// The workflow’s start condition that starts new builds for changes to a branch.
        public var branchStartCondition: CiBranchStartCondition?
        /// A Boolean value that indicates whether Xcode Cloud should perform a clean build.
        public var clean: Bool?
        /// The relative path to your Xcode project or workspace.
        public var containerFilePath: String?
        /// The workflow’s description.
        public var description: String?
        /// A Boolean value that indicates whether the workflow is active or deactivated.
        public var isEnabled: Bool?
        /// A Boolean value that indicates whether edits to the workflow are restricted.
        public var isLockedForEditing: Bool?
        /// The date and time when the workflow was last modified.
        public var lastModifiedDate: Date?
        public var manualBranchStartCondition: CiManualBranchStartCondition?
        public var manualPullRequestStartCondition: CiManualPullRequestStartCondition?
        public var manualTagStartCondition: CiManualTagStartCondition?
        /// The name of the Xcode Cloud workflow; for example, `My Workflow`.
        public var name: String?
        /// The workflow’s start condition for pull request changes.
        public var pullRequestStartCondition: CiPullRequestStartCondition?
        /// The workflow’s start condition that starts new builds on a custom schedule.
        public var scheduledStartCondition: CiScheduledStartCondition?
        /// The workflow’s start condition that starts new builds for changes to a tag.
        public var tagStartCondition: CiTagStartCondition?

        public init(actions: [CiAction]? = nil,
                    branchStartCondition: CiBranchStartCondition? = nil,
                    clean: Bool? = nil,
                    containerFilePath: String? = nil,
                    description: String? = nil,
                    isEnabled: Bool? = nil,
                    isLockedForEditing: Bool? = nil,
                    lastModifiedDate: Date? = nil,
                    manualBranchStartCondition: CiManualBranchStartCondition? = nil,
                    manualPullRequestStartCondition: CiManualPullRequestStartCondition? = nil,
                    manualTagStartCondition: CiManualTagStartCondition? = nil,
                    name: String? = nil,
                    pullRequestStartCondition: CiPullRequestStartCondition? = nil,
                    scheduledStartCondition: CiScheduledStartCondition? = nil,
                    tagStartCondition: CiTagStartCondition? = nil)
        {
            self.actions = actions
            self.branchStartCondition = branchStartCondition
            self.clean = clean
            self.containerFilePath = containerFilePath
            self.description = description
            self.isEnabled = isEnabled
            self.isLockedForEditing = isLockedForEditing
            self.lastModifiedDate = lastModifiedDate
            self.manualBranchStartCondition = manualBranchStartCondition
            self.manualPullRequestStartCondition = manualPullRequestStartCondition
            self.manualTagStartCondition = manualTagStartCondition
            self.name = name
            self.pullRequestStartCondition = pullRequestStartCondition
            self.scheduledStartCondition = scheduledStartCondition
            self.tagStartCondition = tagStartCondition
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            actions = try container.decodeIfPresent([CiAction].self, forKey: "actions")
            branchStartCondition = try container.decodeIfPresent(CiBranchStartCondition.self, forKey: "branchStartCondition")
            clean = try container.decodeIfPresent(Bool.self, forKey: "clean")
            containerFilePath = try container.decodeIfPresent(String.self, forKey: "containerFilePath")
            description = try container.decodeIfPresent(String.self, forKey: "description")
            isEnabled = try container.decodeIfPresent(Bool.self, forKey: "isEnabled")
            isLockedForEditing = try container.decodeIfPresent(Bool.self, forKey: "isLockedForEditing")
            lastModifiedDate = try container.decodeIfPresent(Date.self, forKey: "lastModifiedDate")
            manualBranchStartCondition = try container.decodeIfPresent(CiManualBranchStartCondition.self, forKey: "manualBranchStartCondition")
            manualPullRequestStartCondition = try container.decodeIfPresent(CiManualPullRequestStartCondition.self, forKey: "manualPullRequestStartCondition")
            manualTagStartCondition = try container.decodeIfPresent(CiManualTagStartCondition.self, forKey: "manualTagStartCondition")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            pullRequestStartCondition = try container.decodeIfPresent(CiPullRequestStartCondition.self, forKey: "pullRequestStartCondition")
            scheduledStartCondition = try container.decodeIfPresent(CiScheduledStartCondition.self, forKey: "scheduledStartCondition")
            tagStartCondition = try container.decodeIfPresent(CiTagStartCondition.self, forKey: "tagStartCondition")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(actions, forKey: "actions")
            try container.encodeIfPresent(branchStartCondition, forKey: "branchStartCondition")
            try container.encodeIfPresent(clean, forKey: "clean")
            try container.encodeIfPresent(containerFilePath, forKey: "containerFilePath")
            try container.encodeIfPresent(description, forKey: "description")
            try container.encodeIfPresent(isEnabled, forKey: "isEnabled")
            try container.encodeIfPresent(isLockedForEditing, forKey: "isLockedForEditing")
            try container.encodeIfPresent(lastModifiedDate, forKey: "lastModifiedDate")
            try container.encodeIfPresent(manualBranchStartCondition, forKey: "manualBranchStartCondition")
            try container.encodeIfPresent(manualPullRequestStartCondition, forKey: "manualPullRequestStartCondition")
            try container.encodeIfPresent(manualTagStartCondition, forKey: "manualTagStartCondition")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(pullRequestStartCondition, forKey: "pullRequestStartCondition")
            try container.encodeIfPresent(scheduledStartCondition, forKey: "scheduledStartCondition")
            try container.encodeIfPresent(tagStartCondition, forKey: "tagStartCondition")
        }
    }

    /**
     # CiWorkflow.Relationships
     The relationships of the Workflows resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships>
     */
    public struct Relationships: Codable, Sendable {
        /// The related macOS Versions resource.
        public var macOsVersion: MacOsVersion?
        /// The related Products resource.
        public var product: Product?
        /// The workflow’s related Git repository.
        public var repository: Repository?
        /// The related Xcode Versions resource.
        public var xcodeVersion: XcodeVersion?

        public init(macOsVersion: MacOsVersion? = nil,
                    product: Product? = nil,
                    repository: Repository? = nil,
                    xcodeVersion: XcodeVersion? = nil)
        {
            self.macOsVersion = macOsVersion
            self.product = product
            self.repository = repository
            self.xcodeVersion = xcodeVersion
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            macOsVersion = try container.decodeIfPresent(MacOsVersion.self, forKey: "macOsVersion")
            product = try container.decodeIfPresent(Product.self, forKey: "product")
            repository = try container.decodeIfPresent(Repository.self, forKey: "repository")
            xcodeVersion = try container.decodeIfPresent(XcodeVersion.self, forKey: "xcodeVersion")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(macOsVersion, forKey: "macOsVersion")
            try container.encodeIfPresent(product, forKey: "product")
            try container.encodeIfPresent(repository, forKey: "repository")
            try container.encodeIfPresent(xcodeVersion, forKey: "xcodeVersion")
        }

        /**
         # CiWorkflow.Relationships.MacOsVersion
         The data and links that describe the relationship between the Workflows and the macOS Versions resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/macosversion>
         */
        public struct MacOsVersion: Codable, Sendable {
            /// The ID and type of the related macOS Versions resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # CiWorkflow.Relationships.MacOsVersion.Data
             The type and ID of a related macOS Versions resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/macosversion/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related macOS Versions resource.
                public let id: String
                /// The resource type.
                public var type: String { "ciMacOsVersions" }

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

            /**
             # CiWorkflow.Relationships.MacOsVersion.Links
             The links to the related macOS Versions resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/macosversion/links>
             */
            public struct Links: Codable, Sendable {
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
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # CiWorkflow.Relationships.Product
         The data and links that describe the relationship between the Workflows and the Products resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/product>
         */
        public struct Product: Codable, Sendable {
            /// The ID and type of the related Products resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # CiWorkflow.Relationships.Product.Data
             The type and ID of a related Products resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/product/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Products resource.
                public let id: String
                /// The resource type.
                public var type: String { "ciProducts" }

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

            /**
             # CiWorkflow.Relationships.Product.Links
             The links to the related Products resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/product/links>
             */
            public struct Links: Codable, Sendable {
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
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # CiWorkflow.Relationships.Repository
         The data and links that describe the relationship between the Workflows and the Repositories resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/repository>
         */
        public struct Repository: Codable, Sendable {
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # CiWorkflow.Relationships.Repository.Data
             The type and ID of a related Repositories resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/repository/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Repositories resource.
                public let id: String
                /// The resource type.
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

            /**
             # CiWorkflow.Relationships.Repository.Links
             The links to the related Repositories resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/repository/links>
             */
            public struct Links: Codable, Sendable {
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
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # CiWorkflow.Relationships.XcodeVersion
         The data and links that describe the relationship between the Workflows and the Xcode Versions resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/xcodeversion>
         */
        public struct XcodeVersion: Codable, Sendable {
            /// The ID and type of the related Xcode Versions resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # CiWorkflow.Relationships.XcodeVersion.Data
             The type and ID of a related Xcode Versions resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/xcodeversion/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Xcode Versions resource.
                public let id: String
                /// The resource type.
                public var type: String { "ciXcodeVersions" }

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

            /**
             # CiWorkflow.Relationships.XcodeVersion.Links
             The links to the related Xcode Versions resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflow/relationships/xcodeversion/links>
             */
            public struct Links: Codable, Sendable {
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
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
