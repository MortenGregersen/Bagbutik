import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # NominationUpdateRequest
 The request body you use to update a featuring nomination.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/nominationupdaterequest>
 */
public struct NominationUpdateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "nominations" }
        public var attributes: Attributes?
        public var relationships: Relationships?

        public init(id: String,
                    attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public var archived: Bool?
            public var description: String?
            public var deviceFamilies: [DeviceFamily]?
            public var hasInAppEvents: Bool?
            public var launchInSelectMarketsFirst: Bool?
            public var locales: [String]?
            public var name: String?
            public var notes: String?
            public var preOrderEnabled: Bool?
            public var publishEndDate: Date?
            public var publishStartDate: Date?
            public var submitted: Bool?
            public var supplementalMaterialsUris: [String]?
            public var type: Nomination.Attributes.AttributesType?

            public init(archived: Bool? = nil,
                        description: String? = nil,
                        deviceFamilies: [DeviceFamily]? = nil,
                        hasInAppEvents: Bool? = nil,
                        launchInSelectMarketsFirst: Bool? = nil,
                        locales: [String]? = nil,
                        name: String? = nil,
                        notes: String? = nil,
                        preOrderEnabled: Bool? = nil,
                        publishEndDate: Date? = nil,
                        publishStartDate: Date? = nil,
                        submitted: Bool? = nil,
                        supplementalMaterialsUris: [String]? = nil,
                        type: Nomination.Attributes.AttributesType? = nil)
            {
                self.archived = archived
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
                archived = try container.decodeIfPresent(Bool.self, forKey: "archived")
                description = try container.decodeIfPresent(String.self, forKey: "description")
                deviceFamilies = try container.decodeIfPresent([DeviceFamily].self, forKey: "deviceFamilies")
                hasInAppEvents = try container.decodeIfPresent(Bool.self, forKey: "hasInAppEvents")
                launchInSelectMarketsFirst = try container.decodeIfPresent(Bool.self, forKey: "launchInSelectMarketsFirst")
                locales = try container.decodeIfPresent([String].self, forKey: "locales")
                name = try container.decodeIfPresent(String.self, forKey: "name")
                notes = try container.decodeIfPresent(String.self, forKey: "notes")
                preOrderEnabled = try container.decodeIfPresent(Bool.self, forKey: "preOrderEnabled")
                publishEndDate = try container.decodeIfPresent(Date.self, forKey: "publishEndDate")
                publishStartDate = try container.decodeIfPresent(Date.self, forKey: "publishStartDate")
                submitted = try container.decodeIfPresent(Bool.self, forKey: "submitted")
                supplementalMaterialsUris = try container.decodeIfPresent([String].self, forKey: "supplementalMaterialsUris")
                type = try container.decode(Nomination.Attributes.AttributesType.self, forKey: "type")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(archived, forKey: "archived")
                try container.encodeIfPresent(description, forKey: "description")
                try container.encodeIfPresent(deviceFamilies, forKey: "deviceFamilies")
                try container.encodeIfPresent(hasInAppEvents, forKey: "hasInAppEvents")
                try container.encodeIfPresent(launchInSelectMarketsFirst, forKey: "launchInSelectMarketsFirst")
                try container.encodeIfPresent(locales, forKey: "locales")
                try container.encodeIfPresent(name, forKey: "name")
                try container.encodeIfPresent(notes, forKey: "notes")
                try container.encodeIfPresent(preOrderEnabled, forKey: "preOrderEnabled")
                try container.encodeIfPresent(publishEndDate, forKey: "publishEndDate")
                try container.encodeIfPresent(publishStartDate, forKey: "publishStartDate")
                try container.encodeIfPresent(submitted, forKey: "submitted")
                try container.encodeIfPresent(supplementalMaterialsUris, forKey: "supplementalMaterialsUris")
                try container.encode(type, forKey: "type")
            }
        }

        public struct Relationships: Codable, Sendable {
            public var inAppEvents: InAppEvents?
            public var relatedApps: RelatedApps?
            public var supportedTerritories: SupportedTerritories?

            public init(inAppEvents: InAppEvents? = nil,
                        relatedApps: RelatedApps? = nil,
                        supportedTerritories: SupportedTerritories? = nil)
            {
                self.inAppEvents = inAppEvents
                self.relatedApps = relatedApps
                self.supportedTerritories = supportedTerritories
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                inAppEvents = try container.decodeIfPresent(InAppEvents.self, forKey: "inAppEvents")
                relatedApps = try container.decodeIfPresent(RelatedApps.self, forKey: "relatedApps")
                supportedTerritories = try container.decodeIfPresent(SupportedTerritories.self, forKey: "supportedTerritories")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(inAppEvents, forKey: "inAppEvents")
                try container.encodeIfPresent(relatedApps, forKey: "relatedApps")
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
