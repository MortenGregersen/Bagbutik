import Bagbutik_Core
import Foundation

/**
 # CiBuildAction
 The data structure that represents a Build Actions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildaction>
 */
public struct CiBuildAction: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Build Actions resource.
    public let id: String
    /// The navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "ciBuildActions" }
    /// The attributes that describe the Build Actions resource.
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

    public struct Attributes: Codable, Sendable {
        public var actionType: CiActionType?
        public var completionStatus: CiCompletionStatus?
        public var executionProgress: CiExecutionProgress?
        public var finishedDate: Date?
        public var isRequiredToPass: Bool?
        public var issueCounts: CiIssueCounts?
        public var name: String?
        public var startedDate: Date?

        public init(actionType: CiActionType? = nil,
                    completionStatus: CiCompletionStatus? = nil,
                    executionProgress: CiExecutionProgress? = nil,
                    finishedDate: Date? = nil,
                    isRequiredToPass: Bool? = nil,
                    issueCounts: CiIssueCounts? = nil,
                    name: String? = nil,
                    startedDate: Date? = nil)
        {
            self.actionType = actionType
            self.completionStatus = completionStatus
            self.executionProgress = executionProgress
            self.finishedDate = finishedDate
            self.isRequiredToPass = isRequiredToPass
            self.issueCounts = issueCounts
            self.name = name
            self.startedDate = startedDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            actionType = try container.decodeIfPresent(CiActionType.self, forKey: "actionType")
            completionStatus = try container.decodeIfPresent(CiCompletionStatus.self, forKey: "completionStatus")
            executionProgress = try container.decodeIfPresent(CiExecutionProgress.self, forKey: "executionProgress")
            finishedDate = try container.decodeIfPresent(Date.self, forKey: "finishedDate")
            isRequiredToPass = try container.decodeIfPresent(Bool.self, forKey: "isRequiredToPass")
            issueCounts = try container.decodeIfPresent(CiIssueCounts.self, forKey: "issueCounts")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            startedDate = try container.decodeIfPresent(Date.self, forKey: "startedDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(actionType, forKey: "actionType")
            try container.encodeIfPresent(completionStatus, forKey: "completionStatus")
            try container.encodeIfPresent(executionProgress, forKey: "executionProgress")
            try container.encodeIfPresent(finishedDate, forKey: "finishedDate")
            try container.encodeIfPresent(isRequiredToPass, forKey: "isRequiredToPass")
            try container.encodeIfPresent(issueCounts, forKey: "issueCounts")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(startedDate, forKey: "startedDate")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var artifacts: Artifacts?
        public var buildRun: BuildRun?
        public var issues: Issues?
        public var testResults: TestResults?

        public init(artifacts: Artifacts? = nil,
                    buildRun: BuildRun? = nil,
                    issues: Issues? = nil,
                    testResults: TestResults? = nil)
        {
            self.artifacts = artifacts
            self.buildRun = buildRun
            self.issues = issues
            self.testResults = testResults
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            artifacts = try container.decodeIfPresent(Artifacts.self, forKey: "artifacts")
            buildRun = try container.decodeIfPresent(BuildRun.self, forKey: "buildRun")
            issues = try container.decodeIfPresent(Issues.self, forKey: "issues")
            testResults = try container.decodeIfPresent(TestResults.self, forKey: "testResults")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(artifacts, forKey: "artifacts")
            try container.encodeIfPresent(buildRun, forKey: "buildRun")
            try container.encodeIfPresent(issues, forKey: "issues")
            try container.encodeIfPresent(testResults, forKey: "testResults")
        }

        public struct Artifacts: Codable, Sendable {
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

        public struct BuildRun: Codable, Sendable {
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
                public var type: String { "ciBuildRuns" }

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

        public struct Issues: Codable, Sendable {
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

        public struct TestResults: Codable, Sendable {
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
    }
}
