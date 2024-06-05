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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
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
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
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
            public var manualBranchStartCondition: CiManualBranchStartCondition?
            public var manualPullRequestStartCondition: CiManualPullRequestStartCondition?
            public var manualTagStartCondition: CiManualTagStartCondition?
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                macOsVersion = try container.decodeIfPresent(MacOsVersion.self, forKey: "macOsVersion")
                xcodeVersion = try container.decodeIfPresent(XcodeVersion.self, forKey: "xcodeVersion")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(macOsVersion, forKey: "macOsVersion")
                try container.encodeIfPresent(xcodeVersion, forKey: "xcodeVersion")
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
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
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
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
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
