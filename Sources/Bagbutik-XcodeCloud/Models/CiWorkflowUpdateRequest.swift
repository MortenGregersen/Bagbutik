import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CiWorkflowUpdateRequest
 The request body you use to update an Xcode Cloud workflow.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowupdaterequest>
 */
public struct CiWorkflowUpdateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "ciWorkflows" }
        public var attributes: Attributes?
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

        public struct Attributes: Codable, Sendable {
            public var actions: [CiAction]?
            public var branchStartCondition: CiBranchStartCondition?
            public var clean: Bool?
            public var containerFilePath: String?
            public var description: String?
            public var isEnabled: Bool?
            public var isLockedForEditing: Bool?
            public var manualBranchStartCondition: CiManualBranchStartCondition?
            public var manualPullRequestStartCondition: CiManualPullRequestStartCondition?
            public var manualTagStartCondition: CiManualTagStartCondition?
            public var name: String?
            public var pullRequestStartCondition: CiPullRequestStartCondition?
            public var scheduledStartCondition: CiScheduledStartCondition?
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

        public struct Relationships: Codable, Sendable {
            public var macOsVersion: MacOsVersion?
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

            public struct MacOsVersion: Codable, Sendable {
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

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
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

            public struct XcodeVersion: Codable, Sendable {
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

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
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
