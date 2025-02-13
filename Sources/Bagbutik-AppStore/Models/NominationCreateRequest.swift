import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # NominationCreateRequest
 The request body you use to create a featuring nomination.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/nominationcreaterequest>
 */
public struct NominationCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "nominations" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public let description: String
            public var deviceFamilies: [DeviceFamily]?
            public var hasInAppEvents: Bool?
            public var launchInSelectMarketsFirst: Bool?
            public var locales: [String]?
            public let name: String
            public var notes: String?
            public var preOrderEnabled: Bool?
            public var publishEndDate: Date?
            public let publishStartDate: Date
            public let submitted: Bool
            public var supplementalMaterialsUris: [String]?
            public let type: Nomination.Attributes.AttributesType

            public init(description: String,
                        deviceFamilies: [DeviceFamily]? = nil,
                        hasInAppEvents: Bool? = nil,
                        launchInSelectMarketsFirst: Bool? = nil,
                        locales: [String]? = nil,
                        name: String,
                        notes: String? = nil,
                        preOrderEnabled: Bool? = nil,
                        publishEndDate: Date? = nil,
                        publishStartDate: Date,
                        submitted: Bool,
                        supplementalMaterialsUris: [String]? = nil,
                        type: Nomination.Attributes.AttributesType)
            {
                self.description = description
                self.deviceFamilies = deviceFamilies
                self.hasInAppEvents = hasInAppEvents
                self.launchInSelectMarketsFirst = launchInSelectMarketsFirst
                self.locales = locales
                self.name = name
                self.notes = notes
                self.preOrderEnabled = preOrderEnabled
                self.publishEndDate = publishEndDate
                self.publishStartDate = publishStartDate
                self.submitted = submitted
                self.supplementalMaterialsUris = supplementalMaterialsUris
                self.type = type
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                description = try container.decode(String.self, forKey: "description")
                deviceFamilies = try container.decodeIfPresent([DeviceFamily].self, forKey: "deviceFamilies")
                hasInAppEvents = try container.decodeIfPresent(Bool.self, forKey: "hasInAppEvents")
                launchInSelectMarketsFirst = try container.decodeIfPresent(Bool.self, forKey: "launchInSelectMarketsFirst")
                locales = try container.decodeIfPresent([String].self, forKey: "locales")
                name = try container.decode(String.self, forKey: "name")
                notes = try container.decodeIfPresent(String.self, forKey: "notes")
                preOrderEnabled = try container.decodeIfPresent(Bool.self, forKey: "preOrderEnabled")
                publishEndDate = try container.decodeIfPresent(Date.self, forKey: "publishEndDate")
                publishStartDate = try container.decode(Date.self, forKey: "publishStartDate")
                submitted = try container.decode(Bool.self, forKey: "submitted")
                supplementalMaterialsUris = try container.decodeIfPresent([String].self, forKey: "supplementalMaterialsUris")
                type = try container.decode(Nomination.Attributes.AttributesType.self, forKey: "type")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(description, forKey: "description")
                try container.encodeIfPresent(deviceFamilies, forKey: "deviceFamilies")
                try container.encodeIfPresent(hasInAppEvents, forKey: "hasInAppEvents")
                try container.encodeIfPresent(launchInSelectMarketsFirst, forKey: "launchInSelectMarketsFirst")
                try container.encodeIfPresent(locales, forKey: "locales")
                try container.encode(name, forKey: "name")
                try container.encodeIfPresent(notes, forKey: "notes")
                try container.encodeIfPresent(preOrderEnabled, forKey: "preOrderEnabled")
                try container.encodeIfPresent(publishEndDate, forKey: "publishEndDate")
                try container.encode(publishStartDate, forKey: "publishStartDate")
                try container.encode(submitted, forKey: "submitted")
                try container.encodeIfPresent(supplementalMaterialsUris, forKey: "supplementalMaterialsUris")
                try container.encode(type, forKey: "type")
            }
        }

        public struct Relationships: Codable, Sendable {
            public var inAppEvents: InAppEvents?
            public let relatedApps: RelatedApps
            public var supportedTerritories: SupportedTerritories?

            public init(inAppEvents: InAppEvents? = nil,
                        relatedApps: RelatedApps,
                        supportedTerritories: SupportedTerritories? = nil)
            {
                self.inAppEvents = inAppEvents
                self.relatedApps = relatedApps
                self.supportedTerritories = supportedTerritories
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                inAppEvents = try container.decodeIfPresent(InAppEvents.self, forKey: "inAppEvents")
                relatedApps = try container.decode(RelatedApps.self, forKey: "relatedApps")
                supportedTerritories = try container.decodeIfPresent(SupportedTerritories.self, forKey: "supportedTerritories")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(inAppEvents, forKey: "inAppEvents")
                try container.encode(relatedApps, forKey: "relatedApps")
                try container.encodeIfPresent(supportedTerritories, forKey: "supportedTerritories")
            }

            public struct InAppEvents: Codable, Sendable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent([Data].self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "appEvents" }

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

            public struct RelatedApps: Codable, Sendable {
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode([Data].self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "apps" }

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

            public struct SupportedTerritories: Codable, Sendable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent([Data].self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "territories" }

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
