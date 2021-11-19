import Foundation

/**
 The request body you use to update an Xcode Cloud workflow.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest>
 */
public struct CiWorkflowUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "ciWorkflows" }
        /// The resource's attributes.
        public let attributes: Attributes?
        /// The types and IDs of the related data to update.
        public let relationships: Relationships?

        public init(id: String, attributes: Attributes? = nil, relationships: Relationships? = nil) {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case attributes
            case relationships
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The workflow’s actions.
            public let actions: [CiAction]?
            /// The workflow’s start condition that starts new builds for changes to a branch.
            public let branchStartCondition: CiBranchStartCondition?
            /// A Boolean value that indicates whether Xcode Cloud should perform a clean build.
            public let clean: Bool?
            /// The path to your Xcode project or workspace.
            public let containerFilePath: String?
            /// The workflow description.
            public let description: String?
            /// A Boolean value that indicates whether the workflow is active or deactivated.
            public let isEnabled: Bool?
            /// A Boolean value that indicates whether edits to the workflow are restricted.
            public let isLockedForEditing: Bool?
            /// The name of the workflow you want to create; for example, My Workflow.
            public let name: String?
            /// The workflow’s start condition for pull request changes.
            public let pullRequestStartCondition: CiPullRequestStartCondition?
            /// The workflow’s start condition that starts new builds on a custom schedule.
            public let scheduledStartCondition: CiScheduledStartCondition?
            /// The workflow’s start condition that starts new builds for changes to a tag.
            public let tagStartCondition: CiTagStartCondition?

            public init(actions: [CiAction]? = nil, branchStartCondition: CiBranchStartCondition? = nil, clean: Bool? = nil, containerFilePath: String? = nil, description: String? = nil, isEnabled: Bool? = nil, isLockedForEditing: Bool? = nil, name: String? = nil, pullRequestStartCondition: CiPullRequestStartCondition? = nil, scheduledStartCondition: CiScheduledStartCondition? = nil, tagStartCondition: CiTagStartCondition? = nil) {
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
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let macOsVersion: MacOsVersion?
            public let xcodeVersion: XcodeVersion?

            public init(macOsVersion: MacOsVersion? = nil, xcodeVersion: XcodeVersion? = nil) {
                self.macOsVersion = macOsVersion
                self.xcodeVersion = xcodeVersion
            }

            public struct MacOsVersion: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data/relationships/macosversion/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
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

            public struct XcodeVersion: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data/relationships/xcodeversion/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
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
