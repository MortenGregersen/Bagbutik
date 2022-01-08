import Foundation

/**
 The request body you use to start a new Xcode Cloud build.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest>
 */
public struct CiBuildRunCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "ciBuildRuns" }
        /// The resource's attributes.
        public let attributes: Attributes?
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships?

        public init(attributes: Attributes? = nil, relationships: Relationships? = nil) {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
            case relationships
        }

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// A Boolean value that indicates whether Xcode Cloud should perform a clean build.
            public var clean: Bool?

            public init(clean: Bool? = nil) {
                self.clean = clean
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            @NullCodable public var buildRun: BuildRun?
            @NullCodable public var pullRequest: PullRequest?
            @NullCodable public var sourceBranchOrTag: SourceBranchOrTag?
            @NullCodable public var workflow: Workflow?

            public init(buildRun: BuildRun? = nil, pullRequest: PullRequest? = nil, sourceBranchOrTag: SourceBranchOrTag? = nil, workflow: Workflow? = nil) {
                self.buildRun = buildRun
                self.pullRequest = pullRequest
                self.sourceBranchOrTag = sourceBranchOrTag
                self.workflow = workflow
            }

            public struct BuildRun: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/buildrun/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "ciBuildRuns" }

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

            public struct PullRequest: Codable, RequestBody {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/pullrequest/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "scmPullRequests" }

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

            public struct SourceBranchOrTag: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/sourcebranchortag/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "scmGitReferences" }

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

            public struct Workflow: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildruncreaterequest/data/relationships/workflow/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "ciWorkflows" }

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
