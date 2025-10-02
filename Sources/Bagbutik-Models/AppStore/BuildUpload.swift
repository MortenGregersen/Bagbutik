import Bagbutik_Core
import Foundation

/**
 # BuildUpload
 The data structure that represents a build upload resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildupload>
 */
public struct BuildUpload: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "buildUploads" }
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
        public var cfBundleShortVersionString: String?
        public var cfBundleVersion: String?
        public var createdDate: Date?
        public var platform: Platform?
        public var state: State?
        public var uploadedDate: Date?

        public init(cfBundleShortVersionString: String? = nil,
                    cfBundleVersion: String? = nil,
                    createdDate: Date? = nil,
                    platform: Platform? = nil,
                    state: State? = nil,
                    uploadedDate: Date? = nil)
        {
            self.cfBundleShortVersionString = cfBundleShortVersionString
            self.cfBundleVersion = cfBundleVersion
            self.createdDate = createdDate
            self.platform = platform
            self.state = state
            self.uploadedDate = uploadedDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            cfBundleShortVersionString = try container.decodeIfPresent(String.self, forKey: "cfBundleShortVersionString")
            cfBundleVersion = try container.decodeIfPresent(String.self, forKey: "cfBundleVersion")
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            platform = try container.decodeIfPresent(Platform.self, forKey: "platform")
            state = try container.decodeIfPresent(State.self, forKey: "state")
            uploadedDate = try container.decodeIfPresent(Date.self, forKey: "uploadedDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(cfBundleShortVersionString, forKey: "cfBundleShortVersionString")
            try container.encodeIfPresent(cfBundleVersion, forKey: "cfBundleVersion")
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(platform, forKey: "platform")
            try container.encodeIfPresent(state, forKey: "state")
            try container.encodeIfPresent(uploadedDate, forKey: "uploadedDate")
        }

        public struct State: Codable, Sendable {
            public var errors: [StateDetail]?
            public var infos: [StateDetail]?
            public var state: BuildUploadState?
            public var warnings: [StateDetail]?

            public init(errors: [StateDetail]? = nil,
                        infos: [StateDetail]? = nil,
                        state: BuildUploadState? = nil,
                        warnings: [StateDetail]? = nil)
            {
                self.errors = errors
                self.infos = infos
                self.state = state
                self.warnings = warnings
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                errors = try container.decodeIfPresent([StateDetail].self, forKey: "errors")
                infos = try container.decodeIfPresent([StateDetail].self, forKey: "infos")
                state = try container.decodeIfPresent(BuildUploadState.self, forKey: "state")
                warnings = try container.decodeIfPresent([StateDetail].self, forKey: "warnings")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(errors, forKey: "errors")
                try container.encodeIfPresent(infos, forKey: "infos")
                try container.encodeIfPresent(state, forKey: "state")
                try container.encodeIfPresent(warnings, forKey: "warnings")
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var assetDescriptionFile: AssetDescriptionFile?
        public var assetFile: AssetFile?
        public var assetSpiFile: AssetSpiFile?
        public var build: Build?
        public var buildUploadFiles: BuildUploadFiles?

        public init(assetDescriptionFile: AssetDescriptionFile? = nil,
                    assetFile: AssetFile? = nil,
                    assetSpiFile: AssetSpiFile? = nil,
                    build: Build? = nil,
                    buildUploadFiles: BuildUploadFiles? = nil)
        {
            self.assetDescriptionFile = assetDescriptionFile
            self.assetFile = assetFile
            self.assetSpiFile = assetSpiFile
            self.build = build
            self.buildUploadFiles = buildUploadFiles
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            assetDescriptionFile = try container.decodeIfPresent(AssetDescriptionFile.self, forKey: "assetDescriptionFile")
            assetFile = try container.decodeIfPresent(AssetFile.self, forKey: "assetFile")
            assetSpiFile = try container.decodeIfPresent(AssetSpiFile.self, forKey: "assetSpiFile")
            build = try container.decodeIfPresent(Build.self, forKey: "build")
            buildUploadFiles = try container.decodeIfPresent(BuildUploadFiles.self, forKey: "buildUploadFiles")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(assetDescriptionFile, forKey: "assetDescriptionFile")
            try container.encodeIfPresent(assetFile, forKey: "assetFile")
            try container.encodeIfPresent(assetSpiFile, forKey: "assetSpiFile")
            try container.encodeIfPresent(build, forKey: "build")
            try container.encodeIfPresent(buildUploadFiles, forKey: "buildUploadFiles")
        }

        public struct AssetDescriptionFile: Codable, Sendable {
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
                public var type: String { "buildUploadFiles" }

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

        public struct AssetFile: Codable, Sendable {
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
                public var type: String { "buildUploadFiles" }

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

        public struct AssetSpiFile: Codable, Sendable {
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
                public var type: String { "buildUploadFiles" }

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

        public struct Build: Codable, Sendable {
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

        public struct BuildUploadFiles: Codable, Sendable {
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
