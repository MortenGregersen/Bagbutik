import Bagbutik_Core
import Foundation

public struct AppStoreVersionExperimentTreatment: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appStoreVersionExperimentTreatments" }
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
        public var appIcon: ImageAsset?
        public var appIconName: String?
        public var name: String?
        public var promotedDate: Date?

        public init(appIcon: ImageAsset? = nil,
                    appIconName: String? = nil,
                    name: String? = nil,
                    promotedDate: Date? = nil)
        {
            self.appIcon = appIcon
            self.appIconName = appIconName
            self.name = name
            self.promotedDate = promotedDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appIcon = try container.decodeIfPresent(ImageAsset.self, forKey: "appIcon")
            appIconName = try container.decodeIfPresent(String.self, forKey: "appIconName")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            promotedDate = try container.decodeIfPresent(Date.self, forKey: "promotedDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appIcon, forKey: "appIcon")
            try container.encodeIfPresent(appIconName, forKey: "appIconName")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(promotedDate, forKey: "promotedDate")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var appStoreVersionExperiment: AppStoreVersionExperiment?
        public var appStoreVersionExperimentTreatmentLocalizations: AppStoreVersionExperimentTreatmentLocalizations?
        public var appStoreVersionExperimentV2: AppStoreVersionExperimentV2?

        public init(appStoreVersionExperiment: AppStoreVersionExperiment? = nil,
                    appStoreVersionExperimentTreatmentLocalizations: AppStoreVersionExperimentTreatmentLocalizations? = nil,
                    appStoreVersionExperimentV2: AppStoreVersionExperimentV2? = nil)
        {
            self.appStoreVersionExperiment = appStoreVersionExperiment
            self.appStoreVersionExperimentTreatmentLocalizations = appStoreVersionExperimentTreatmentLocalizations
            self.appStoreVersionExperimentV2 = appStoreVersionExperimentV2
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appStoreVersionExperiment = try container.decodeIfPresent(AppStoreVersionExperiment.self, forKey: "appStoreVersionExperiment")
            appStoreVersionExperimentTreatmentLocalizations = try container.decodeIfPresent(AppStoreVersionExperimentTreatmentLocalizations.self, forKey: "appStoreVersionExperimentTreatmentLocalizations")
            appStoreVersionExperimentV2 = try container.decodeIfPresent(AppStoreVersionExperimentV2.self, forKey: "appStoreVersionExperimentV2")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appStoreVersionExperiment, forKey: "appStoreVersionExperiment")
            try container.encodeIfPresent(appStoreVersionExperimentTreatmentLocalizations, forKey: "appStoreVersionExperimentTreatmentLocalizations")
            try container.encodeIfPresent(appStoreVersionExperimentV2, forKey: "appStoreVersionExperimentV2")
        }

        public struct AppStoreVersionExperiment: Codable, Sendable {
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
                public var type: String { "appStoreVersionExperiments" }

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

        public struct AppStoreVersionExperimentTreatmentLocalizations: Codable, Sendable {
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
                public var type: String { "appStoreVersionExperimentTreatmentLocalizations" }

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

        public struct AppStoreVersionExperimentV2: Codable, Sendable {
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
                public var type: String { "appStoreVersionExperiments" }

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
