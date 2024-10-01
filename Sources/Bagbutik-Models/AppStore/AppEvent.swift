import Bagbutik_Core
import Foundation

public struct AppEvent: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appEvents" }
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
        public var archivedTerritorySchedules: [ArchivedTerritorySchedules]?
        public var badge: Badge?
        public var deepLink: String?
        public var eventState: EventState?
        public var primaryLocale: String?
        public var priority: Priority?
        public var purchaseRequirement: PurchaseRequirement?
        public var purpose: Purpose?
        public var referenceName: String?
        public var territorySchedules: [TerritorySchedules]?

        public init(archivedTerritorySchedules: [ArchivedTerritorySchedules]? = nil,
                    badge: Badge? = nil,
                    deepLink: String? = nil,
                    eventState: EventState? = nil,
                    primaryLocale: String? = nil,
                    priority: Priority? = nil,
                    purchaseRequirement: PurchaseRequirement? = nil,
                    purpose: Purpose? = nil,
                    referenceName: String? = nil,
                    territorySchedules: [TerritorySchedules]? = nil)
        {
            self.archivedTerritorySchedules = archivedTerritorySchedules
            self.badge = badge
            self.deepLink = deepLink
            self.eventState = eventState
            self.primaryLocale = primaryLocale
            self.priority = priority
            self.purchaseRequirement = purchaseRequirement
            self.purpose = purpose
            self.referenceName = referenceName
            self.territorySchedules = territorySchedules
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            archivedTerritorySchedules = try container.decodeIfPresent([ArchivedTerritorySchedules].self, forKey: "archivedTerritorySchedules")
            badge = try container.decodeIfPresent(Badge.self, forKey: "badge")
            deepLink = try container.decodeIfPresent(String.self, forKey: "deepLink")
            eventState = try container.decodeIfPresent(EventState.self, forKey: "eventState")
            primaryLocale = try container.decodeIfPresent(String.self, forKey: "primaryLocale")
            priority = try container.decodeIfPresent(Priority.self, forKey: "priority")
            purchaseRequirement = try container.decodeIfPresent(PurchaseRequirement.self, forKey: "purchaseRequirement")
            purpose = try container.decodeIfPresent(Purpose.self, forKey: "purpose")
            referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
            territorySchedules = try container.decodeIfPresent([TerritorySchedules].self, forKey: "territorySchedules")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(archivedTerritorySchedules, forKey: "archivedTerritorySchedules")
            try container.encodeIfPresent(badge, forKey: "badge")
            try container.encodeIfPresent(deepLink, forKey: "deepLink")
            try container.encodeIfPresent(eventState, forKey: "eventState")
            try container.encodeIfPresent(primaryLocale, forKey: "primaryLocale")
            try container.encodeIfPresent(priority, forKey: "priority")
            try container.encodeIfPresent(purchaseRequirement, forKey: "purchaseRequirement")
            try container.encodeIfPresent(purpose, forKey: "purpose")
            try container.encodeIfPresent(referenceName, forKey: "referenceName")
            try container.encodeIfPresent(territorySchedules, forKey: "territorySchedules")
        }

        public struct ArchivedTerritorySchedules: Codable, Sendable {
            public var eventEnd: Date?
            public var eventStart: Date?
            public var publishStart: Date?
            public var territories: [String]?

            public init(eventEnd: Date? = nil,
                        eventStart: Date? = nil,
                        publishStart: Date? = nil,
                        territories: [String]? = nil)
            {
                self.eventEnd = eventEnd
                self.eventStart = eventStart
                self.publishStart = publishStart
                self.territories = territories
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                eventEnd = try container.decodeIfPresent(Date.self, forKey: "eventEnd")
                eventStart = try container.decodeIfPresent(Date.self, forKey: "eventStart")
                publishStart = try container.decodeIfPresent(Date.self, forKey: "publishStart")
                territories = try container.decodeIfPresent([String].self, forKey: "territories")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(eventEnd, forKey: "eventEnd")
                try container.encodeIfPresent(eventStart, forKey: "eventStart")
                try container.encodeIfPresent(publishStart, forKey: "publishStart")
                try container.encodeIfPresent(territories, forKey: "territories")
            }
        }

        public enum Badge: String, Sendable, Codable, CaseIterable {
            case challenge = "CHALLENGE"
            case competition = "COMPETITION"
            case liveEvent = "LIVE_EVENT"
            case majorUpdate = "MAJOR_UPDATE"
            case newSeason = "NEW_SEASON"
            case premiere = "PREMIERE"
            case specialEvent = "SPECIAL_EVENT"
        }

        public enum EventState: String, Sendable, Codable, CaseIterable {
            case accepted = "ACCEPTED"
            case approved = "APPROVED"
            case archived = "ARCHIVED"
            case draft = "DRAFT"
            case inReview = "IN_REVIEW"
            case past = "PAST"
            case published = "PUBLISHED"
            case readyForReview = "READY_FOR_REVIEW"
            case rejected = "REJECTED"
            case waitingForReview = "WAITING_FOR_REVIEW"
        }

        public enum Priority: String, Sendable, Codable, CaseIterable {
            case high = "HIGH"
            case normal = "NORMAL"
        }

        public enum PurchaseRequirement: String, Sendable, Codable, CaseIterable {
            case inAppPurchase = "IN_APP_PURCHASE"
            case inAppPurchaseAndSubscription = "IN_APP_PURCHASE_AND_SUBSCRIPTION"
            case inAppPurchaseOrSubscription = "IN_APP_PURCHASE_OR_SUBSCRIPTION"
            case noCostAssociated = "NO_COST_ASSOCIATED"
            case subscription = "SUBSCRIPTION"
        }

        public enum Purpose: String, Sendable, Codable, CaseIterable {
            case appropriateForAllUsers = "APPROPRIATE_FOR_ALL_USERS"
            case attractNewUsers = "ATTRACT_NEW_USERS"
            case bringBackLapsedUsers = "BRING_BACK_LAPSED_USERS"
            case keepActiveUsersInformed = "KEEP_ACTIVE_USERS_INFORMED"
        }

        public struct TerritorySchedules: Codable, Sendable {
            public var eventEnd: Date?
            public var eventStart: Date?
            public var publishStart: Date?
            public var territories: [String]?

            public init(eventEnd: Date? = nil,
                        eventStart: Date? = nil,
                        publishStart: Date? = nil,
                        territories: [String]? = nil)
            {
                self.eventEnd = eventEnd
                self.eventStart = eventStart
                self.publishStart = publishStart
                self.territories = territories
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                eventEnd = try container.decodeIfPresent(Date.self, forKey: "eventEnd")
                eventStart = try container.decodeIfPresent(Date.self, forKey: "eventStart")
                publishStart = try container.decodeIfPresent(Date.self, forKey: "publishStart")
                territories = try container.decodeIfPresent([String].self, forKey: "territories")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(eventEnd, forKey: "eventEnd")
                try container.encodeIfPresent(eventStart, forKey: "eventStart")
                try container.encodeIfPresent(publishStart, forKey: "publishStart")
                try container.encodeIfPresent(territories, forKey: "territories")
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var localizations: Localizations?

        public init(localizations: Localizations? = nil) {
            self.localizations = localizations
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            localizations = try container.decodeIfPresent(Localizations.self, forKey: "localizations")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(localizations, forKey: "localizations")
        }

        public struct Localizations: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: Links?
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

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appEventLocalizations" }

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

            public struct Links: Codable, Sendable {
                public var related: String?
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
