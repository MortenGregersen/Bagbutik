import Bagbutik_Core
import Foundation

/**
 # Nomination
 The data structure that represents a nomination resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/nomination>
 */
public struct Nomination: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "nominations" }
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
        public var description: String?
        public var deviceFamilies: [DeviceFamily]?
        public var hasInAppEvents: Bool?
        public var lastModifiedDate: Date?
        public var launchInSelectMarketsFirst: Bool?
        public var locales: [String]?
        public var name: String?
        public var notes: String?
        public var preOrderEnabled: Bool?
        public var publishEndDate: Date?
        public var publishStartDate: Date?
        public var state: State?
        public var submittedDate: Date?
        public var supplementalMaterialsUris: [String]?
        public var type: AttributesType?

        public init(createdDate: Date? = nil,
                    description: String? = nil,
                    deviceFamilies: [DeviceFamily]? = nil,
                    hasInAppEvents: Bool? = nil,
                    lastModifiedDate: Date? = nil,
                    launchInSelectMarketsFirst: Bool? = nil,
                    locales: [String]? = nil,
                    name: String? = nil,
                    notes: String? = nil,
                    preOrderEnabled: Bool? = nil,
                    publishEndDate: Date? = nil,
                    publishStartDate: Date? = nil,
                    state: State? = nil,
                    submittedDate: Date? = nil,
                    supplementalMaterialsUris: [String]? = nil,
                    type: AttributesType? = nil)
        {
            self.createdDate = createdDate
            self.description = description
            self.deviceFamilies = deviceFamilies
            self.hasInAppEvents = hasInAppEvents
            self.lastModifiedDate = lastModifiedDate
            self.launchInSelectMarketsFirst = launchInSelectMarketsFirst
            self.locales = locales
            self.name = name
            self.notes = notes
            self.preOrderEnabled = preOrderEnabled
            self.publishEndDate = publishEndDate
            self.publishStartDate = publishStartDate
            self.state = state
            self.submittedDate = submittedDate
            self.supplementalMaterialsUris = supplementalMaterialsUris
            self.type = type
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            description = try container.decodeIfPresent(String.self, forKey: "description")
            deviceFamilies = try container.decodeIfPresent([DeviceFamily].self, forKey: "deviceFamilies")
            hasInAppEvents = try container.decodeIfPresent(Bool.self, forKey: "hasInAppEvents")
            lastModifiedDate = try container.decodeIfPresent(Date.self, forKey: "lastModifiedDate")
            launchInSelectMarketsFirst = try container.decodeIfPresent(Bool.self, forKey: "launchInSelectMarketsFirst")
            locales = try container.decodeIfPresent([String].self, forKey: "locales")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            notes = try container.decodeIfPresent(String.self, forKey: "notes")
            preOrderEnabled = try container.decodeIfPresent(Bool.self, forKey: "preOrderEnabled")
            publishEndDate = try container.decodeIfPresent(Date.self, forKey: "publishEndDate")
            publishStartDate = try container.decodeIfPresent(Date.self, forKey: "publishStartDate")
            state = try container.decodeIfPresent(State.self, forKey: "state")
            submittedDate = try container.decodeIfPresent(Date.self, forKey: "submittedDate")
            supplementalMaterialsUris = try container.decodeIfPresent([String].self, forKey: "supplementalMaterialsUris")
            type = try container.decode(AttributesType.self, forKey: "type")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(description, forKey: "description")
            try container.encodeIfPresent(deviceFamilies, forKey: "deviceFamilies")
            try container.encodeIfPresent(hasInAppEvents, forKey: "hasInAppEvents")
            try container.encodeIfPresent(lastModifiedDate, forKey: "lastModifiedDate")
            try container.encodeIfPresent(launchInSelectMarketsFirst, forKey: "launchInSelectMarketsFirst")
            try container.encodeIfPresent(locales, forKey: "locales")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(notes, forKey: "notes")
            try container.encodeIfPresent(preOrderEnabled, forKey: "preOrderEnabled")
            try container.encodeIfPresent(publishEndDate, forKey: "publishEndDate")
            try container.encodeIfPresent(publishStartDate, forKey: "publishStartDate")
            try container.encodeIfPresent(state, forKey: "state")
            try container.encodeIfPresent(submittedDate, forKey: "submittedDate")
            try container.encodeIfPresent(supplementalMaterialsUris, forKey: "supplementalMaterialsUris")
            try container.encode(type, forKey: "type")
        }

        public enum AttributesType: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appEnhancements = "APP_ENHANCEMENTS"
            case appLaunch = "APP_LAUNCH"
            case newContent = "NEW_CONTENT"
        }

        public enum State: String, Sendable, ParameterValue, Codable, CaseIterable {
            case archived = "ARCHIVED"
            case draft = "DRAFT"
            case submitted = "SUBMITTED"
        }
    }

    public struct Relationships: Codable, Sendable {
        public var createdByActor: CreatedByActor?
        public var inAppEvents: InAppEvents?
        public var lastModifiedByActor: LastModifiedByActor?
        public var relatedApps: RelatedApps?
        public var submittedByActor: SubmittedByActor?
        public var supportedTerritories: SupportedTerritories?

        public init(createdByActor: CreatedByActor? = nil,
                    inAppEvents: InAppEvents? = nil,
                    lastModifiedByActor: LastModifiedByActor? = nil,
                    relatedApps: RelatedApps? = nil,
                    submittedByActor: SubmittedByActor? = nil,
                    supportedTerritories: SupportedTerritories? = nil)
        {
            self.createdByActor = createdByActor
            self.inAppEvents = inAppEvents
            self.lastModifiedByActor = lastModifiedByActor
            self.relatedApps = relatedApps
            self.submittedByActor = submittedByActor
            self.supportedTerritories = supportedTerritories
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            createdByActor = try container.decodeIfPresent(CreatedByActor.self, forKey: "createdByActor")
            inAppEvents = try container.decodeIfPresent(InAppEvents.self, forKey: "inAppEvents")
            lastModifiedByActor = try container.decodeIfPresent(LastModifiedByActor.self, forKey: "lastModifiedByActor")
            relatedApps = try container.decodeIfPresent(RelatedApps.self, forKey: "relatedApps")
            submittedByActor = try container.decodeIfPresent(SubmittedByActor.self, forKey: "submittedByActor")
            supportedTerritories = try container.decodeIfPresent(SupportedTerritories.self, forKey: "supportedTerritories")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(createdByActor, forKey: "createdByActor")
            try container.encodeIfPresent(inAppEvents, forKey: "inAppEvents")
            try container.encodeIfPresent(lastModifiedByActor, forKey: "lastModifiedByActor")
            try container.encodeIfPresent(relatedApps, forKey: "relatedApps")
            try container.encodeIfPresent(submittedByActor, forKey: "submittedByActor")
            try container.encodeIfPresent(supportedTerritories, forKey: "supportedTerritories")
        }

        public struct CreatedByActor: Codable, Sendable {
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
                public var type: String { "actors" }

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

        public struct InAppEvents: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(meta, forKey: "meta")
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

        public struct LastModifiedByActor: Codable, Sendable {
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
                public var type: String { "actors" }

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
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(meta, forKey: "meta")
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

        public struct SubmittedByActor: Codable, Sendable {
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
                public var type: String { "actors" }

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
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(meta, forKey: "meta")
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
