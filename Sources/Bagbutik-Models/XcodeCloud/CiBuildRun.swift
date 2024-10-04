import Bagbutik_Core
import Foundation

/**
 # CiBuildRun
 The data structure that represents a Build Runs resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun>
 */
public struct CiBuildRun: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Build Runs resource.
    public let id: String
    /// The navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "ciBuildRuns" }
    /// The attributes that describe the Build Runs resource.
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
        public var cancelReason: CancelReason?
        public var completionStatus: CiCompletionStatus?
        public var createdDate: Date?
        public var destinationCommit: DestinationCommit?
        public var executionProgress: CiExecutionProgress?
        public var finishedDate: Date?
        public var isPullRequestBuild: Bool?
        public var issueCounts: CiIssueCounts?
        public var number: Int?
        public var sourceCommit: SourceCommit?
        public var startReason: StartReason?
        public var startedDate: Date?

        public init(cancelReason: CancelReason? = nil,
                    completionStatus: CiCompletionStatus? = nil,
                    createdDate: Date? = nil,
                    destinationCommit: DestinationCommit? = nil,
                    executionProgress: CiExecutionProgress? = nil,
                    finishedDate: Date? = nil,
                    isPullRequestBuild: Bool? = nil,
                    issueCounts: CiIssueCounts? = nil,
                    number: Int? = nil,
                    sourceCommit: SourceCommit? = nil,
                    startReason: StartReason? = nil,
                    startedDate: Date? = nil)
        {
            self.cancelReason = cancelReason
            self.completionStatus = completionStatus
            self.createdDate = createdDate
            self.destinationCommit = destinationCommit
            self.executionProgress = executionProgress
            self.finishedDate = finishedDate
            self.isPullRequestBuild = isPullRequestBuild
            self.issueCounts = issueCounts
            self.number = number
            self.sourceCommit = sourceCommit
            self.startReason = startReason
            self.startedDate = startedDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            cancelReason = try container.decodeIfPresent(CancelReason.self, forKey: "cancelReason")
            completionStatus = try container.decodeIfPresent(CiCompletionStatus.self, forKey: "completionStatus")
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            destinationCommit = try container.decodeIfPresent(DestinationCommit.self, forKey: "destinationCommit")
            executionProgress = try container.decodeIfPresent(CiExecutionProgress.self, forKey: "executionProgress")
            finishedDate = try container.decodeIfPresent(Date.self, forKey: "finishedDate")
            isPullRequestBuild = try container.decodeIfPresent(Bool.self, forKey: "isPullRequestBuild")
            issueCounts = try container.decodeIfPresent(CiIssueCounts.self, forKey: "issueCounts")
            number = try container.decodeIfPresent(Int.self, forKey: "number")
            sourceCommit = try container.decodeIfPresent(SourceCommit.self, forKey: "sourceCommit")
            startReason = try container.decodeIfPresent(StartReason.self, forKey: "startReason")
            startedDate = try container.decodeIfPresent(Date.self, forKey: "startedDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(cancelReason, forKey: "cancelReason")
            try container.encodeIfPresent(completionStatus, forKey: "completionStatus")
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(destinationCommit, forKey: "destinationCommit")
            try container.encodeIfPresent(executionProgress, forKey: "executionProgress")
            try container.encodeIfPresent(finishedDate, forKey: "finishedDate")
            try container.encodeIfPresent(isPullRequestBuild, forKey: "isPullRequestBuild")
            try container.encodeIfPresent(issueCounts, forKey: "issueCounts")
            try container.encodeIfPresent(number, forKey: "number")
            try container.encodeIfPresent(sourceCommit, forKey: "sourceCommit")
            try container.encodeIfPresent(startReason, forKey: "startReason")
            try container.encodeIfPresent(startedDate, forKey: "startedDate")
        }

        public enum CancelReason: String, Sendable, Codable, CaseIterable {
            case automaticallyByNewerBuild = "AUTOMATICALLY_BY_NEWER_BUILD"
            case manuallyByUser = "MANUALLY_BY_USER"
        }

        public struct DestinationCommit: Codable, Sendable {
            public var author: CiGitUser?
            public var commitSha: String?
            public var committer: CiGitUser?
            public var message: String?
            public var webUrl: String?

            public init(author: CiGitUser? = nil,
                        commitSha: String? = nil,
                        committer: CiGitUser? = nil,
                        message: String? = nil,
                        webUrl: String? = nil)
            {
                self.author = author
                self.commitSha = commitSha
                self.committer = committer
                self.message = message
                self.webUrl = webUrl
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                author = try container.decodeIfPresent(CiGitUser.self, forKey: "author")
                commitSha = try container.decodeIfPresent(String.self, forKey: "commitSha")
                committer = try container.decodeIfPresent(CiGitUser.self, forKey: "committer")
                message = try container.decodeIfPresent(String.self, forKey: "message")
                webUrl = try container.decodeIfPresent(String.self, forKey: "webUrl")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(author, forKey: "author")
                try container.encodeIfPresent(commitSha, forKey: "commitSha")
                try container.encodeIfPresent(committer, forKey: "committer")
                try container.encodeIfPresent(message, forKey: "message")
                try container.encodeIfPresent(webUrl, forKey: "webUrl")
            }
        }

        public struct SourceCommit: Codable, Sendable {
            public var author: CiGitUser?
            public var commitSha: String?
            public var committer: CiGitUser?
            public var message: String?
            public var webUrl: String?

            public init(author: CiGitUser? = nil,
                        commitSha: String? = nil,
                        committer: CiGitUser? = nil,
                        message: String? = nil,
                        webUrl: String? = nil)
            {
                self.author = author
                self.commitSha = commitSha
                self.committer = committer
                self.message = message
                self.webUrl = webUrl
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                author = try container.decodeIfPresent(CiGitUser.self, forKey: "author")
                commitSha = try container.decodeIfPresent(String.self, forKey: "commitSha")
                committer = try container.decodeIfPresent(CiGitUser.self, forKey: "committer")
                message = try container.decodeIfPresent(String.self, forKey: "message")
                webUrl = try container.decodeIfPresent(String.self, forKey: "webUrl")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(author, forKey: "author")
                try container.encodeIfPresent(commitSha, forKey: "commitSha")
                try container.encodeIfPresent(committer, forKey: "committer")
                try container.encodeIfPresent(message, forKey: "message")
                try container.encodeIfPresent(webUrl, forKey: "webUrl")
            }
        }

        public enum StartReason: String, Sendable, Codable, CaseIterable {
            case gitRefChange = "GIT_REF_CHANGE"
            case manual = "MANUAL"
            case manualRebuild = "MANUAL_REBUILD"
            case pullRequestOpen = "PULL_REQUEST_OPEN"
            case pullRequestUpdate = "PULL_REQUEST_UPDATE"
            case schedule = "SCHEDULE"
        }
    }

    public struct Relationships: Codable, Sendable {
        public var actions: Actions?
        public var builds: Builds?
        public var destinationBranch: DestinationBranch?
        public var product: Product?
        public var pullRequest: PullRequest?
        public var sourceBranchOrTag: SourceBranchOrTag?
        public var workflow: Workflow?

        public init(actions: Actions? = nil,
                    builds: Builds? = nil,
                    destinationBranch: DestinationBranch? = nil,
                    product: Product? = nil,
                    pullRequest: PullRequest? = nil,
                    sourceBranchOrTag: SourceBranchOrTag? = nil,
                    workflow: Workflow? = nil)
        {
            self.actions = actions
            self.builds = builds
            self.destinationBranch = destinationBranch
            self.product = product
            self.pullRequest = pullRequest
            self.sourceBranchOrTag = sourceBranchOrTag
            self.workflow = workflow
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            actions = try container.decodeIfPresent(Actions.self, forKey: "actions")
            builds = try container.decodeIfPresent(Builds.self, forKey: "builds")
            destinationBranch = try container.decodeIfPresent(DestinationBranch.self, forKey: "destinationBranch")
            product = try container.decodeIfPresent(Product.self, forKey: "product")
            pullRequest = try container.decodeIfPresent(PullRequest.self, forKey: "pullRequest")
            sourceBranchOrTag = try container.decodeIfPresent(SourceBranchOrTag.self, forKey: "sourceBranchOrTag")
            workflow = try container.decodeIfPresent(Workflow.self, forKey: "workflow")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(actions, forKey: "actions")
            try container.encodeIfPresent(builds, forKey: "builds")
            try container.encodeIfPresent(destinationBranch, forKey: "destinationBranch")
            try container.encodeIfPresent(product, forKey: "product")
            try container.encodeIfPresent(pullRequest, forKey: "pullRequest")
            try container.encodeIfPresent(sourceBranchOrTag, forKey: "sourceBranchOrTag")
            try container.encodeIfPresent(workflow, forKey: "workflow")
        }

        public struct Actions: Codable, Sendable {
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

        public struct Builds: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "builds" }

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

        public struct DestinationBranch: Codable, Sendable {
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
                public var type: String { "scmGitReferences" }

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

        public struct PullRequest: Codable, Sendable, RequestBody {
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
                public var type: String { "scmPullRequests" }

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

        public struct SourceBranchOrTag: Codable, Sendable {
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
                public var type: String { "scmGitReferences" }

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

        public struct Workflow: Codable, Sendable {
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
                public var type: String { "ciWorkflows" }

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
