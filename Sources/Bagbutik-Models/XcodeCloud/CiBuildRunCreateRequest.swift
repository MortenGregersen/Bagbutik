import Bagbutik_Core
import Foundation

/**
 # CiBuildRunCreateRequest
 The request body you use to start a new Xcode Cloud build.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest>
 */
public struct CiBuildRunCreateRequest: Codable, Sendable, RequestBody {
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
     # CiBuildRunCreateRequest.Data
     The data element of the request you use to start a new Xcode Cloud build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data>
     */
    public struct Data: Codable, Sendable {
        /// The resource type.
        public var type: String { "ciBuildRuns" }
        /// The attributes that describe the request that creates a Build Runs resource.
        public var attributes: Attributes?
        /// The types and IDs of the related data to update.
        public var relationships: Relationships?

        public init(attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        /**
         # CiBuildRunCreateRequest.Data.Attributes
         The attributes you set that describe the new Build Runs resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/attributes>
         */
        public struct Attributes: Codable, Sendable {
            /// A Boolean value that indicates whether Xcode Cloud should perform a clean build.
            public var clean: Bool?

            public init(clean: Bool? = nil) {
                self.clean = clean
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                clean = try container.decodeIfPresent(Bool.self, forKey: "clean")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(clean, forKey: "clean")
            }
        }

        /**
         # CiBuildRunCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships>
         */
        public struct Relationships: Codable, Sendable {
            /// The related Build Runs resource.
            public var buildRun: BuildRun?
            /// The related Pull Requests resource.
            public var pullRequest: PullRequest?
            /// The related Git References resource.
            public var sourceBranchOrTag: SourceBranchOrTag?
            /// The related Workflows resource.
            public var workflow: Workflow?

            public init(buildRun: BuildRun? = nil,
                        pullRequest: PullRequest? = nil,
                        sourceBranchOrTag: SourceBranchOrTag? = nil,
                        workflow: Workflow? = nil)
            {
                self.buildRun = buildRun
                self.pullRequest = pullRequest
                self.sourceBranchOrTag = sourceBranchOrTag
                self.workflow = workflow
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                buildRun = try container.decodeIfPresent(BuildRun.self, forKey: "buildRun")
                pullRequest = try container.decodeIfPresent(PullRequest.self, forKey: "pullRequest")
                sourceBranchOrTag = try container.decodeIfPresent(SourceBranchOrTag.self, forKey: "sourceBranchOrTag")
                workflow = try container.decodeIfPresent(Workflow.self, forKey: "workflow")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(buildRun, forKey: "buildRun")
                try container.encodeIfPresent(pullRequest, forKey: "pullRequest")
                try container.encodeIfPresent(sourceBranchOrTag, forKey: "sourceBranchOrTag")
                try container.encodeIfPresent(workflow, forKey: "workflow")
            }

            /**
             # CiBuildRunCreateRequest.Data.Relationships.BuildRun
             The relationship to the Build Runs resource you can set with the request that creates a Build Runs resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/buildrun>
             */
            public struct BuildRun: Codable, Sendable {
                /// The ID and type of the related Build Runs resource.
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
                 # CiBuildRunCreateRequest.Data.Relationships.BuildRun.Data
                 The type and ID of the Build Runs resource that you’re relating with the Build Runs resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/buildrun/data>
                 */
                public struct Data: Codable, Sendable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related Build Runs resource.
                    public let id: String
                    /// The resource type.
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

            /**
             # CiBuildRunCreateRequest.Data.Relationships.PullRequest
             The relationship to the Pull Requests resource you can set with the request that creates a Build Runs resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/pullrequest>
             */
            public struct PullRequest: Codable, Sendable, RequestBody {
                /// The ID and type of the related Pull Requests resource.
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
                 # CiBuildRunCreateRequest.Data.Relationships.PullRequest.Data
                 The type and ID of the Pull Requests resource that you’re relating with the Build Runs resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/pullrequest/data>
                 */
                public struct Data: Codable, Sendable, Identifiable {
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
            }

            /**
             # CiBuildRunCreateRequest.Data.Relationships.SourceBranchOrTag
             The relationship to the Git References resource that represents the source branch or tag you can set with the request that creates a Build Runs resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/sourcebranchortag>
             */
            public struct SourceBranchOrTag: Codable, Sendable {
                /// The ID and type of the related Git References resource that represents the source branch or tag.
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
                 # CiBuildRunCreateRequest.Data.Relationships.SourceBranchOrTag.Data
                 The type and ID of the Git References resource that represents the source branch or tag you relate with the Build Runs resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/sourcebranchortag/data>
                 */
                public struct Data: Codable, Sendable, Identifiable {
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
            }

            /**
             # CiBuildRunCreateRequest.Data.Relationships.Workflow
             The relationship to the Workflows resource you can set with the request that creates a Build Runs resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/workflow>
             */
            public struct Workflow: Codable, Sendable {
                /// The ID and type of the related Workflows resource.
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
                 # CiBuildRunCreateRequest.Data.Relationships.Workflow.Data
                 The type and ID of the Workflows resource that you’re relating with the Build Runs resource you’re creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/workflow/data>
                 */
                public struct Data: Codable, Sendable, Identifiable {
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
            }
        }
    }
}
