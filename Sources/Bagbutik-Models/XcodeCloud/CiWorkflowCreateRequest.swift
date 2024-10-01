import Bagbutik_Core
import Foundation

/**
 # CiWorkflowCreateRequest
 The request body you use to create a new Xcode Cloud workflow.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest>
 */
public struct CiWorkflowCreateRequest: Codable, Sendable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    /**
     # CiWorkflowCreateRequest.Data
     The data element of the request you use to create a new Xcode Cloud workflow.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data>
     */
    public struct Data: Codable, Sendable {
        /// The resource type.
        public var type: String { "ciWorkflows" }
        /// The attributes that describe the request that creates a Workflows resource.
        public let attributes: Attributes
        /// The types and IDs of the related data to update.
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        /**
         # CiWorkflowCreateRequest.Data.Attributes
         The attributes you set that describe the new Xcode Cloud workflow resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/attributes>
         */
        public struct Attributes: Codable, Sendable {
            /// The workflow’s actions.
            public let actions: [CiAction]
            /// A start condition that starts new builds for changes to a branch.
            public var branchStartCondition: CiBranchStartCondition?
            /// A Boolean value that indicates whether Xcode Cloud should perform a clean build.
            public let clean: Bool
            /// The relative path to your Xcode project or workspace.
            public let containerFilePath: String
            /// The workflow description.
            public let description: String
            /// A Boolean value that indicates whether the workflow is active or deactivated.
            public let isEnabled: Bool
            /// A Boolean value that indicates whether edits to the workflow are restricted.
            public var isLockedForEditing: Bool?
            public var manualBranchStartCondition: CiManualBranchStartCondition?
            public var manualPullRequestStartCondition: CiManualPullRequestStartCondition?
            public var manualTagStartCondition: CiManualTagStartCondition?
            /// The name of the workflow you want to create; for example, `My New Workflow`.
            public let name: String
            /// A start condition that starts new builds for changes to a pull request.
            public var pullRequestStartCondition: CiPullRequestStartCondition?
            /// A start condition that starts new builds based on a custom schedule.
            public var scheduledStartCondition: CiScheduledStartCondition?
            /// A start condition that starts new builds for changes to a tag.
            public var tagStartCondition: CiTagStartCondition?

            public init(actions: [CiAction],
                        branchStartCondition: CiBranchStartCondition? = nil,
                        clean: Bool,
                        containerFilePath: String,
                        description: String,
                        isEnabled: Bool,
                        isLockedForEditing: Bool? = nil,
                        manualBranchStartCondition: CiManualBranchStartCondition? = nil,
                        manualPullRequestStartCondition: CiManualPullRequestStartCondition? = nil,
                        manualTagStartCondition: CiManualTagStartCondition? = nil,
                        name: String,
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
                actions = try container.decode([CiAction].self, forKey: "actions")
                branchStartCondition = try container.decodeIfPresent(CiBranchStartCondition.self, forKey: "branchStartCondition")
                clean = try container.decode(Bool.self, forKey: "clean")
                containerFilePath = try container.decode(String.self, forKey: "containerFilePath")
                description = try container.decode(String.self, forKey: "description")
                isEnabled = try container.decode(Bool.self, forKey: "isEnabled")
                isLockedForEditing = try container.decodeIfPresent(Bool.self, forKey: "isLockedForEditing")
                manualBranchStartCondition = try container.decodeIfPresent(CiManualBranchStartCondition.self, forKey: "manualBranchStartCondition")
                manualPullRequestStartCondition = try container.decodeIfPresent(CiManualPullRequestStartCondition.self, forKey: "manualPullRequestStartCondition")
                manualTagStartCondition = try container.decodeIfPresent(CiManualTagStartCondition.self, forKey: "manualTagStartCondition")
                name = try container.decode(String.self, forKey: "name")
                pullRequestStartCondition = try container.decodeIfPresent(CiPullRequestStartCondition.self, forKey: "pullRequestStartCondition")
                scheduledStartCondition = try container.decodeIfPresent(CiScheduledStartCondition.self, forKey: "scheduledStartCondition")
                tagStartCondition = try container.decodeIfPresent(CiTagStartCondition.self, forKey: "tagStartCondition")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(actions, forKey: "actions")
                try container.encodeIfPresent(branchStartCondition, forKey: "branchStartCondition")
                try container.encode(clean, forKey: "clean")
                try container.encode(containerFilePath, forKey: "containerFilePath")
                try container.encode(description, forKey: "description")
                try container.encode(isEnabled, forKey: "isEnabled")
                try container.encodeIfPresent(isLockedForEditing, forKey: "isLockedForEditing")
                try container.encodeIfPresent(manualBranchStartCondition, forKey: "manualBranchStartCondition")
                try container.encodeIfPresent(manualPullRequestStartCondition, forKey: "manualPullRequestStartCondition")
                try container.encodeIfPresent(manualTagStartCondition, forKey: "manualTagStartCondition")
                try container.encode(name, forKey: "name")
                try container.encodeIfPresent(pullRequestStartCondition, forKey: "pullRequestStartCondition")
                try container.encodeIfPresent(scheduledStartCondition, forKey: "scheduledStartCondition")
                try container.encodeIfPresent(tagStartCondition, forKey: "tagStartCondition")
            }
        }

        /**
         # CiWorkflowCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships>
         */
        public struct Relationships: Codable, Sendable {
            /// The related macOS Versions resource.
            public let macOsVersion: MacOsVersion
            /// The related Products resource.
            public let product: Product
            /// The related Repositories resource.
            public let repository: Repository
            /// The related Xcode Versions resource.
            public let xcodeVersion: XcodeVersion

            public init(macOsVersion: MacOsVersion,
                        product: Product,
                        repository: Repository,
                        xcodeVersion: XcodeVersion)
            {
                self.macOsVersion = macOsVersion
                self.product = product
                self.repository = repository
                self.xcodeVersion = xcodeVersion
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                macOsVersion = try container.decode(MacOsVersion.self, forKey: "macOsVersion")
                product = try container.decode(Product.self, forKey: "product")
                repository = try container.decode(Repository.self, forKey: "repository")
                xcodeVersion = try container.decode(XcodeVersion.self, forKey: "xcodeVersion")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(macOsVersion, forKey: "macOsVersion")
                try container.encode(product, forKey: "product")
                try container.encode(repository, forKey: "repository")
                try container.encode(xcodeVersion, forKey: "xcodeVersion")
            }

            /**
             # CiWorkflowCreateRequest.Data.Relationships.MacOsVersion
             The relationship to the macOS Versions resource you set with the request that creates a Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/macosversion>
             */
            public struct MacOsVersion: Codable, Sendable {
                /// The ID and type of the related macOS Versions resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # CiWorkflowCreateRequest.Data.Relationships.MacOsVersion.Data
                 The type and ID of the macOS Versions resource that you’re relating with the Workflows resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/macosversion/data>
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
            }

            /**
             # CiWorkflowCreateRequest.Data.Relationships.Product
             The relationship to the Products resource you set with the request that creates a Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/product>
             */
            public struct Product: Codable, Sendable {
                /// The ID and type of the related Products resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # CiWorkflowCreateRequest.Data.Relationships.Product.Data
                 The type and ID of the Products resource that you’re relating with the Workflows resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/product/data>
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
            }

            /**
             # CiWorkflowCreateRequest.Data.Relationships.Repository
             The relationship to the Repositories Versions resource you set with the request that creates a Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/repository>
             */
            public struct Repository: Codable, Sendable {
                /// The ID and type of the related Repositories resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # CiWorkflowCreateRequest.Data.Relationships.Repository.Data
                 The type and ID of the Repositories resource that you’re relating with the Workflows resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/repository/data>
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
            }

            /**
             # CiWorkflowCreateRequest.Data.Relationships.XcodeVersion
             The relationship to the Xcode Versions resource you set with the request that creates a Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/xcodeversion>
             */
            public struct XcodeVersion: Codable, Sendable {
                /// The ID and type of the related Xcode Versions resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # CiWorkflowCreateRequest.Data.Relationships.XcodeVersion.Data
                 The type and ID of the Xcode Versions resource that you’re relating with the Workflows resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/xcodeversion/data>
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
            }
        }
    }
}
