import Foundation

/**
 # CiWorkflowCreateRequest
 The request body you use to create a new Xcode Cloud workflow.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest>
 */
public struct CiWorkflowCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # CiWorkflowCreateRequest.Data
     The data element of the request you use to create a new Xcode Cloud workflow.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data>
     */
    public struct Data: Codable {
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
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case relationships
            case type
        }

        /**
         # CiWorkflowCreateRequest.Data.Attributes
         The attributes you set that describe the new Workflows resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
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
                self.name = name
                self.pullRequestStartCondition = pullRequestStartCondition
                self.scheduledStartCondition = scheduledStartCondition
                self.tagStartCondition = tagStartCondition
            }
        }

        /**
         # CiWorkflowCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
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

            /**
             # CiWorkflowCreateRequest.Data.Relationships.MacOsVersion
             The relationship to the macOS Versions resource you set with the request that creates a Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/macosversion>
             */
            public struct MacOsVersion: Codable {
                /// The ID and type of the related macOS Versions resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # CiWorkflowCreateRequest.Data.Relationships.MacOsVersion.Data
                 The type and ID of the macOS Versions resource that you’re relating with the Workflows resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/macosversion/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related macOS Versions resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "ciMacOsVersions" }

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
            }

            /**
             # CiWorkflowCreateRequest.Data.Relationships.Product
             The relationship to the Products resource you set with the request that creates a Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/product>
             */
            public struct Product: Codable {
                /// The ID and type of the related Products resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # CiWorkflowCreateRequest.Data.Relationships.Product.Data
                 The type and ID of the Products resource that you’re relating with the Workflows resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/product/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related Products resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "ciProducts" }

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
            }

            /**
             # CiWorkflowCreateRequest.Data.Relationships.Repository
             The relationship to the Repositories Versions resource you set with the request that creates a Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/repository>
             */
            public struct Repository: Codable {
                /// The ID and type of the related Repositories resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # CiWorkflowCreateRequest.Data.Relationships.Repository.Data
                 The type and ID of the Repositories resource that you’re relating with the Workflows resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/repository/data>
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
            }

            /**
             # CiWorkflowCreateRequest.Data.Relationships.XcodeVersion
             The relationship to the Xcode Versions resource you set with the request that creates a Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/xcodeversion>
             */
            public struct XcodeVersion: Codable {
                /// The ID and type of the related Xcode Versions resource.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # CiWorkflowCreateRequest.Data.Relationships.XcodeVersion.Data
                 The type and ID of the Xcode Versions resource that you’re relating with the Workflows resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowcreaterequest/data/relationships/xcodeversion/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related Xcode Versions resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "ciXcodeVersions" }

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
            }
        }
    }
}
