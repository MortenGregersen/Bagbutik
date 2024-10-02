import Bagbutik_Core
import Foundation

public struct AlternativeDistributionPackageVersion: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "alternativeDistributionPackageVersions" }
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
        public var fileChecksum: String?
        public var state: State?
        public var url: String?
        public var urlExpirationDate: Date?
        public var version: String?

        public init(fileChecksum: String? = nil,
                    state: State? = nil,
                    url: String? = nil,
                    urlExpirationDate: Date? = nil,
                    version: String? = nil)
        {
            self.fileChecksum = fileChecksum
            self.state = state
            self.url = url
            self.urlExpirationDate = urlExpirationDate
            self.version = version
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            fileChecksum = try container.decodeIfPresent(String.self, forKey: "fileChecksum")
            state = try container.decodeIfPresent(State.self, forKey: "state")
            url = try container.decodeIfPresent(String.self, forKey: "url")
            urlExpirationDate = try container.decodeIfPresent(Date.self, forKey: "urlExpirationDate")
            version = try container.decodeIfPresent(String.self, forKey: "version")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(fileChecksum, forKey: "fileChecksum")
            try container.encodeIfPresent(state, forKey: "state")
            try container.encodeIfPresent(url, forKey: "url")
            try container.encodeIfPresent(urlExpirationDate, forKey: "urlExpirationDate")
            try container.encodeIfPresent(version, forKey: "version")
        }

        public enum State: String, Sendable, Codable, CaseIterable {
            case completed = "COMPLETED"
            case replaced = "REPLACED"
        }
    }

    public struct Relationships: Codable, Sendable {
        public var alternativeDistributionPackage: AlternativeDistributionPackage?
        public var deltas: Deltas?
        public var variants: Variants?

        public init(alternativeDistributionPackage: AlternativeDistributionPackage? = nil,
                    deltas: Deltas? = nil,
                    variants: Variants? = nil)
        {
            self.alternativeDistributionPackage = alternativeDistributionPackage
            self.deltas = deltas
            self.variants = variants
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            alternativeDistributionPackage = try container.decodeIfPresent(AlternativeDistributionPackage.self, forKey: "alternativeDistributionPackage")
            deltas = try container.decodeIfPresent(Deltas.self, forKey: "deltas")
            variants = try container.decodeIfPresent(Variants.self, forKey: "variants")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(alternativeDistributionPackage, forKey: "alternativeDistributionPackage")
            try container.encodeIfPresent(deltas, forKey: "deltas")
            try container.encodeIfPresent(variants, forKey: "variants")
        }

        public struct AlternativeDistributionPackage: Codable, Sendable {
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
                public var type: String { "alternativeDistributionPackages" }

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

        public struct Deltas: Codable, Sendable {
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
                public var type: String { "alternativeDistributionPackageDeltas" }

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

        public struct Variants: Codable, Sendable {
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
                public var type: String { "alternativeDistributionPackageVariants" }

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
