import Bagbutik_Core
import Foundation

/**
 # BackgroundAssetVersion
 The data structure that represents a background asset version resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetversion>
 */
public struct BackgroundAssetVersion: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "backgroundAssetVersions" }
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
        public var createdDate: Date?
        public var platforms: [Platform]?
        public var state: BackgroundAssetVersionState?
        public var stateDetails: StateDetails?
        public var version: String?

        public init(createdDate: Date? = nil,
                    platforms: [Platform]? = nil,
                    state: BackgroundAssetVersionState? = nil,
                    stateDetails: StateDetails? = nil,
                    version: String? = nil)
        {
            self.createdDate = createdDate
            self.platforms = platforms
            self.state = state
            self.stateDetails = stateDetails
            self.version = version
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            platforms = try container.decodeIfPresent([Platform].self, forKey: "platforms")
            state = try container.decodeIfPresent(BackgroundAssetVersionState.self, forKey: "state")
            stateDetails = try container.decodeIfPresent(StateDetails.self, forKey: "stateDetails")
            version = try container.decodeIfPresent(String.self, forKey: "version")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(platforms, forKey: "platforms")
            try container.encodeIfPresent(state, forKey: "state")
            try container.encodeIfPresent(stateDetails, forKey: "stateDetails")
            try container.encodeIfPresent(version, forKey: "version")
        }

        public struct StateDetails: Codable, Sendable {
            public var errors: [StateDetail]?
            public var infos: [StateDetail]?
            public var warnings: [StateDetail]?

            public init(errors: [StateDetail]? = nil,
                        infos: [StateDetail]? = nil,
                        warnings: [StateDetail]? = nil)
            {
                self.errors = errors
                self.infos = infos
                self.warnings = warnings
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                errors = try container.decodeIfPresent([StateDetail].self, forKey: "errors")
                infos = try container.decodeIfPresent([StateDetail].self, forKey: "infos")
                warnings = try container.decodeIfPresent([StateDetail].self, forKey: "warnings")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(errors, forKey: "errors")
                try container.encodeIfPresent(infos, forKey: "infos")
                try container.encodeIfPresent(warnings, forKey: "warnings")
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var appStoreRelease: AppStoreRelease?
        public var assetFile: AssetFile?
        public var backgroundAsset: BackgroundAsset?
        public var backgroundAssetUploadFiles: BackgroundAssetUploadFiles?
        public var externalBetaRelease: ExternalBetaRelease?
        public var internalBetaRelease: InternalBetaRelease?
        public var manifestFile: ManifestFile?

        public init(appStoreRelease: AppStoreRelease? = nil,
                    assetFile: AssetFile? = nil,
                    backgroundAsset: BackgroundAsset? = nil,
                    backgroundAssetUploadFiles: BackgroundAssetUploadFiles? = nil,
                    externalBetaRelease: ExternalBetaRelease? = nil,
                    internalBetaRelease: InternalBetaRelease? = nil,
                    manifestFile: ManifestFile? = nil)
        {
            self.appStoreRelease = appStoreRelease
            self.assetFile = assetFile
            self.backgroundAsset = backgroundAsset
            self.backgroundAssetUploadFiles = backgroundAssetUploadFiles
            self.externalBetaRelease = externalBetaRelease
            self.internalBetaRelease = internalBetaRelease
            self.manifestFile = manifestFile
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appStoreRelease = try container.decodeIfPresent(AppStoreRelease.self, forKey: "appStoreRelease")
            assetFile = try container.decodeIfPresent(AssetFile.self, forKey: "assetFile")
            backgroundAsset = try container.decodeIfPresent(BackgroundAsset.self, forKey: "backgroundAsset")
            backgroundAssetUploadFiles = try container.decodeIfPresent(BackgroundAssetUploadFiles.self, forKey: "backgroundAssetUploadFiles")
            externalBetaRelease = try container.decodeIfPresent(ExternalBetaRelease.self, forKey: "externalBetaRelease")
            internalBetaRelease = try container.decodeIfPresent(InternalBetaRelease.self, forKey: "internalBetaRelease")
            manifestFile = try container.decodeIfPresent(ManifestFile.self, forKey: "manifestFile")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appStoreRelease, forKey: "appStoreRelease")
            try container.encodeIfPresent(assetFile, forKey: "assetFile")
            try container.encodeIfPresent(backgroundAsset, forKey: "backgroundAsset")
            try container.encodeIfPresent(backgroundAssetUploadFiles, forKey: "backgroundAssetUploadFiles")
            try container.encodeIfPresent(externalBetaRelease, forKey: "externalBetaRelease")
            try container.encodeIfPresent(internalBetaRelease, forKey: "internalBetaRelease")
            try container.encodeIfPresent(manifestFile, forKey: "manifestFile")
        }

        public struct AppStoreRelease: Codable, Sendable {
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
                public var type: String { "backgroundAssetVersionAppStoreReleases" }

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
                public var type: String { "backgroundAssetUploadFiles" }

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

        public struct BackgroundAsset: Codable, Sendable {
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
                public var type: String { "backgroundAssets" }

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

        public struct BackgroundAssetUploadFiles: Codable, Sendable {
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

        public struct ExternalBetaRelease: Codable, Sendable {
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
                public var type: String { "backgroundAssetVersionExternalBetaReleases" }

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

        public struct InternalBetaRelease: Codable, Sendable {
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
                public var type: String { "backgroundAssetVersionInternalBetaReleases" }

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

        public struct ManifestFile: Codable, Sendable {
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
                public var type: String { "backgroundAssetUploadFiles" }

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
