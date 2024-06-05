import Bagbutik_Core
import Foundation

/**
 # CiBuildRun
 The data structure that represents a Build Runs resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun>
 */
public struct CiBuildRun: Codable, Identifiable {
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

    /**
     # CiBuildRun.Attributes
     The attributes that describe a Build Runs resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/attributes>
     */
    public struct Attributes: Codable {
        /// A string that indicates the reason for a canceled build.
        public var cancelReason: CancelReason?
        /// A string that indicates the status of a completed build.
        public var completionStatus: CiCompletionStatus?
        /// The date and time when Xcode Cloud created the build.
        public var createdDate: Date?
        /// Detailed information about the commit of a pull request build’s target branch. This value is only available to builds from pull requests.
        public var destinationCommit: DestinationCommit?
        /// A string that indicates the progress of the build action.
        public var executionProgress: CiExecutionProgress?
        /// The date and time when Xcode Cloud completed the build.
        public var finishedDate: Date?
        /// A Boolean value that indicates whether the build was started by a change to a pull request.
        public var isPullRequestBuild: Bool?
        /// An integer value that represents the number of issues Xcode Cloud encountered when it performed the build.
        public var issueCounts: CiIssueCounts?
        /// The Xcode Cloud build number.
        public var number: Int?
        /// Detailed information about the commit of a pull request build’s source branch. This value is only available to builds from pull requests.
        public var sourceCommit: SourceCommit?
        /// A string that indicates what started the build.
        public var startReason: StartReason?
        /// The date and time when Xcode Cloud started the build.
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

        public enum CancelReason: String, Codable, CaseIterable {
            case automaticallyByNewerBuild = "AUTOMATICALLY_BY_NEWER_BUILD"
            case manuallyByUser = "MANUALLY_BY_USER"
        }

        /**
         # CiBuildRun.Attributes.DestinationCommit
         The latest commit of a pull request’s target branch or the source commit for builds that aren’t pull request builds.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/attributes/destinationcommit>
         */
        public struct DestinationCommit: Codable {
            /// The author of the commit.
            public var author: CiGitUser?
            /// The commit hash.
            public var commitSha: String?
            /// The commit’s Git committer.
            public var committer: CiGitUser?
            /// The commit message.
            public var message: String?
            /// The commit URL.
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

        /**
         # CiBuildRun.Attributes.SourceCommit
         The latest commit of a Git branch or tag, or of a pull request’s source branch.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/attributes/sourcecommit>
         */
        public struct SourceCommit: Codable {
            /// The author of the commit.
            public var author: CiGitUser?
            /// The commit hash.
            public var commitSha: String?
            /// The commit’s Git committer.
            public var committer: CiGitUser?
            /// The commit message.
            public var message: String?
            /// The commit URL.
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

        public enum StartReason: String, Codable, CaseIterable {
            case gitRefChange = "GIT_REF_CHANGE"
            case manual = "MANUAL"
            case manualRebuild = "MANUAL_REBUILD"
            case pullRequestOpen = "PULL_REQUEST_OPEN"
            case pullRequestUpdate = "PULL_REQUEST_UPDATE"
            case schedule = "SCHEDULE"
        }
    }

    /**
     # CiBuildRun.Relationships
     The relationships of the Build Runs resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships>
     */
    public struct Relationships: Codable {
        /// The data and links that describe the relationship between the Build Runs and the Builds resources.
        public var builds: Builds?
        /// The data and links that describe the relationship between the Build Runs resource and the Git References resource that represents the destination branch.
        public var destinationBranch: DestinationBranch?
        /// The data and links that describe the relationship between the Build Runs and the Products resources.
        public var product: Product?
        /// The data and links that describe the relationship between the Build Runs and the Pull Requests resources.
        public var pullRequest: PullRequest?
        /// The data and links that describe the relationship between the Build Runs resource and the Git References resource that represents the source branch or tag.
        public var sourceBranchOrTag: SourceBranchOrTag?
        /// The data and links that describe the relationship between the Build Runs and the Workflows resources.
        public var workflow: Workflow?

        public init(builds: Builds? = nil,
                    destinationBranch: DestinationBranch? = nil,
                    product: Product? = nil,
                    pullRequest: PullRequest? = nil,
                    sourceBranchOrTag: SourceBranchOrTag? = nil,
                    workflow: Workflow? = nil)
        {
            self.builds = builds
            self.destinationBranch = destinationBranch
            self.product = product
            self.pullRequest = pullRequest
            self.sourceBranchOrTag = sourceBranchOrTag
            self.workflow = workflow
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            builds = try container.decodeIfPresent(Builds.self, forKey: "builds")
            destinationBranch = try container.decodeIfPresent(DestinationBranch.self, forKey: "destinationBranch")
            product = try container.decodeIfPresent(Product.self, forKey: "product")
            pullRequest = try container.decodeIfPresent(PullRequest.self, forKey: "pullRequest")
            sourceBranchOrTag = try container.decodeIfPresent(SourceBranchOrTag.self, forKey: "sourceBranchOrTag")
            workflow = try container.decodeIfPresent(Workflow.self, forKey: "workflow")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(builds, forKey: "builds")
            try container.encodeIfPresent(destinationBranch, forKey: "destinationBranch")
            try container.encodeIfPresent(product, forKey: "product")
            try container.encodeIfPresent(pullRequest, forKey: "pullRequest")
            try container.encodeIfPresent(sourceBranchOrTag, forKey: "sourceBranchOrTag")
            try container.encodeIfPresent(workflow, forKey: "workflow")
        }

        /**
         # CiBuildRun.Relationships.Builds
         The data, links, and paging information that describe the relationship between the Build Runs and the Builds resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/builds>
         */
        public struct Builds: Codable {
            /// The ID and type of the related Builds resource.
            @NullCodable public var data: [Data]?
            /// The navigational links that include the self-link.
            public var links: Links?
            /// The paging information.
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            /**
             # CiBuildRun.Relationships.Builds.Data
             The type and ID of a related Builds resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/builds/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Builds resource.
                public let id: String
                /// The resource type.
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

            /**
             # CiBuildRun.Relationships.Builds.Links
             The links to the related Builds resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/builds/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # CiBuildRun.Relationships.DestinationBranch
         The data and links that describe the relationship between the Build Runs resource and the Git References resource that represents the destination branch.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/destinationbranch>
         */
        public struct DestinationBranch: Codable {
            /// The ID of the related Git References resource that represents the destination branch.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # CiBuildRun.Relationships.DestinationBranch.Data
             The type and ID of a related Git References resource that represents the build run’s destination branch.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/destinationbranch/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Git References resource that represents the destination branch.
                public let id: String
                /// The resource type.
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

            /**
             # CiBuildRun.Relationships.DestinationBranch.Links
             The links to the related Git References resource that represents the destination branch and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/destinationbranch/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # CiBuildRun.Relationships.Product
         The data and links that describe the relationship between the Build Runs and the Products resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/product>
         */
        public struct Product: Codable {
            /// The ID and type of the related Products resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # CiBuildRun.Relationships.Product.Data
             The type and ID of a related Products resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/product/data>
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

            /**
             # CiBuildRun.Relationships.Product.Links
             The links to the related Products resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/product/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # CiBuildRun.Relationships.PullRequest
         The data and links that describe the relationship between the Build Runs and the Pull Requests resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/pullrequest>
         */
        public struct PullRequest: Codable, RequestBody {
            /// The ID and type of the related Pull Requests resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # CiBuildRun.Relationships.PullRequest.Data
             The type and ID of a related Pull Requests resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/pullrequest/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Pull Requests resource.
                public let id: String
                /// The resource type.
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

            /**
             # CiBuildRun.Relationships.PullRequest.Links
             The links to the related Pull Requests resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/pullrequest/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # CiBuildRun.Relationships.SourceBranchOrTag
         The data and links that describe the relationship between the Build Runs and the Git References resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/sourcebranchortag>
         */
        public struct SourceBranchOrTag: Codable {
            /// The ID and type of the related Git References resource that represents the source branch or tag.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # CiBuildRun.Relationships.SourceBranchOrTag.Data
             The type and ID of a related Git References resource that represents the source branch or tag.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/sourcebranchortag/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Git References resource that represents the source branch or tag.
                public let id: String
                /// The resource type.
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

            /**
             # CiBuildRun.Relationships.SourceBranchOrTag.Links
             The links to the related Git References resource that represents the source branch or tag and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/sourcebranchortag/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # CiBuildRun.Relationships.Workflow
         The data and links that describe the relationship between the Build Runs and the Workflows resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/workflow>
         */
        public struct Workflow: Codable {
            /// The ID and type of the related Workflows resource.
            @NullCodable public var data: Data?
            /// The navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # CiBuildRun.Relationships.Workflow.Data
             The type and ID of a related Workflows resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/workflow/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related Workflows resource.
                public let id: String
                /// The resource type.
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

            /**
             # CiBuildRun.Relationships.Workflow.Links
             The links to the related Workflows resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildrun/relationships/workflow/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
