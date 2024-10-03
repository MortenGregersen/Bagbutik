import Bagbutik_Core
import Foundation

public struct CiWorkflow: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "ciWorkflows" }
    public var attributes: Attributes?
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

    public struct Attributes: Codable, Sendable {
        public var actions: [CiAction]?
        public var branchStartCondition: CiBranchStartCondition?
        public var clean: Bool?
        public var containerFilePath: String?
        public var description: String?
        public var isEnabled: Bool?
        public var isLockedForEditing: Bool?
        public var lastModifiedDate: Date?
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

    public struct Relationships: Codable, Sendable {
        public var buildRuns: BuildRuns?
        public var macOsVersion: MacOsVersion?
        public var product: Product?
        public var repository: Repository?
        public var xcodeVersion: XcodeVersion?

        public init(buildRuns: BuildRuns? = nil,
                    macOsVersion: MacOsVersion? = nil,
                    product: Product? = nil,
                    repository: Repository? = nil,
                    xcodeVersion: XcodeVersion? = nil)
        {
            self.buildRuns = buildRuns
            self.macOsVersion = macOsVersion
            self.product = product
            self.repository = repository
            self.xcodeVersion = xcodeVersion
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            buildRuns = try container.decodeIfPresent(BuildRuns.self, forKey: "buildRuns")
            macOsVersion = try container.decodeIfPresent(MacOsVersion.self, forKey: "macOsVersion")
            product = try container.decodeIfPresent(Product.self, forKey: "product")
            repository = try container.decodeIfPresent(Repository.self, forKey: "repository")
            xcodeVersion = try container.decodeIfPresent(XcodeVersion.self, forKey: "xcodeVersion")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(buildRuns, forKey: "buildRuns")
            try container.encodeIfPresent(macOsVersion, forKey: "macOsVersion")
            try container.encodeIfPresent(product, forKey: "product")
            try container.encodeIfPresent(repository, forKey: "repository")
            try container.encodeIfPresent(xcodeVersion, forKey: "xcodeVersion")
        }

        public struct BuildRuns: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
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

        public struct Product: Codable, Sendable {
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
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
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
