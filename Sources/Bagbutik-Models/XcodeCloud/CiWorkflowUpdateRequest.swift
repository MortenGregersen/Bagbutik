import Bagbutik_Core
import Foundation

/**
 # CiWorkflowUpdateRequest
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
     # CiWorkflowUpdateRequest.Data
     The data element of the request you use to update an Xcode Cloud workflow.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// The opaque resource ID that uniquely identifies the request.
        public let id: String
        /// The resource type.
        public var type: String { "ciWorkflows" }
        /// The attributes that describe the request that updates a Workflows resource.
        public var attributes: Attributes?
        /// The types and IDs of the related data to update.
        public var relationships: Relationships?

        public init(id: String,
                    attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
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
            case attributes
            case id
            case relationships
            case type
        }

        /**
         # CiWorkflowUpdateRequest.Data.Attributes
         The attributes of the Workflows resource you’re changing with the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The workflow’s actions.
            public var actions: [CiAction]?
            /// The workflow’s start condition that starts new builds for changes to a branch.
            public var branchStartCondition: CiBranchStartCondition?
            /// A Boolean value that indicates whether Xcode Cloud should perform a clean build.
            public var clean: Bool?
            /// The path to your Xcode project or workspace.
            public var containerFilePath: String?
            /// The workflow description.
            public var description: String?
            /// A Boolean value that indicates whether the workflow is active or deactivated.
            public var isEnabled: Bool?
            /// A Boolean value that indicates whether edits to the workflow are restricted.
            public var isLockedForEditing: Bool?
            /// The name of the workflow you want to create; for example, `My Workflow`.
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
                self.name = name
                self.pullRequestStartCondition = pullRequestStartCondition
                self.scheduledStartCondition = scheduledStartCondition
                self.tagStartCondition = tagStartCondition
            }
        }

        /**
         # CiWorkflowUpdateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The related macOS Versions resource.
            public var macOsVersion: MacOsVersion?
            /// The related Xcode Versions resource.
            public var xcodeVersion: XcodeVersion?

            public init(macOsVersion: MacOsVersion? = nil,
                        xcodeVersion: XcodeVersion? = nil)
            {
                self.macOsVersion = macOsVersion
                self.xcodeVersion = xcodeVersion
            }

            /**
             # CiWorkflowUpdateRequest.Data.Relationships.MacOsVersion
             The relationship to the macOS Versions resource you can set with the request that updates a Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data/relationships/macosversion>
             */
            public struct MacOsVersion: Codable {
                /// The ID and type of the related macOS Versions resource.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    _data = try container.decode(NullCodable<Data>.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # CiWorkflowUpdateRequest.Data.Relationships.MacOsVersion.Data
                 The type and ID of the macOS Versions resource that you’re relating with the Workflows resource you’re updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data/relationships/macosversion/data>
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
             # CiWorkflowUpdateRequest.Data.Relationships.XcodeVersion
             The relationship to the Xcode Versions resource you can set with the request that updates a Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data/relationships/xcodeversion>
             */
            public struct XcodeVersion: Codable {
                /// The ID and type of the related Xcode Versions resource.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    _data = try container.decode(NullCodable<Data>.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # CiWorkflowUpdateRequest.Data.Relationships.XcodeVersion.Data
                 The type and ID of the Xcode Versions resource that you’re relating with the Workflows resource you’re updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest/data/relationships/xcodeversion/data>
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
