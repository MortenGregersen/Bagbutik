import Bagbutik_Core
import Foundation

public struct CiWorkflowCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "ciWorkflows" }
        public let attributes: Attributes
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

        public struct Attributes: Codable, Sendable {
            public let actions: [CiAction]
            public var branchStartCondition: CiBranchStartCondition?
            public let clean: Bool
            public let containerFilePath: String
            public let description: String
            public let isEnabled: Bool
            public var isLockedForEditing: Bool?
            public var manualBranchStartCondition: CiManualBranchStartCondition?
            public var manualPullRequestStartCondition: CiManualPullRequestStartCondition?
            public var manualTagStartCondition: CiManualTagStartCondition?
            public let name: String
            public var pullRequestStartCondition: CiPullRequestStartCondition?
            public var scheduledStartCondition: CiScheduledStartCondition?
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

        public struct Relationships: Codable, Sendable {
            public let macOsVersion: MacOsVersion
            public let product: Product
            public let repository: Repository
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

            public struct MacOsVersion: Codable, Sendable {
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

            public struct Product: Codable, Sendable {
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

            public struct Repository: Codable, Sendable {
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

            public struct XcodeVersion: Codable, Sendable {
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
