import Bagbutik_Core
import Foundation

public struct AppEvent: Codable, Identifiable {
    public let id: String
    public let links: ResourceLinks
    public var type: String { "appEvents" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    public struct Attributes: Codable {
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

        public struct ArchivedTerritorySchedules: Codable {
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
        }

        public enum Badge: String, Codable, CaseIterable {
            case liveEvent = "LIVE_EVENT"
            case premiere = "PREMIERE"
            case challenge = "CHALLENGE"
            case competition = "COMPETITION"
            case newSeason = "NEW_SEASON"
            case majorUpdate = "MAJOR_UPDATE"
            case specialEvent = "SPECIAL_EVENT"
        }

        public enum EventState: String, Codable, CaseIterable {
            case draft = "DRAFT"
            case readyForReview = "READY_FOR_REVIEW"
            case waitingForReview = "WAITING_FOR_REVIEW"
            case inReview = "IN_REVIEW"
            case rejected = "REJECTED"
            case accepted = "ACCEPTED"
            case approved = "APPROVED"
            case published = "PUBLISHED"
            case past = "PAST"
            case archived = "ARCHIVED"
        }

        public enum Priority: String, Codable, CaseIterable {
            case high = "HIGH"
            case normal = "NORMAL"
        }

        public enum PurchaseRequirement: String, Codable, CaseIterable {
            case noCostAssociated = "NO_COST_ASSOCIATED"
            case inAppPurchase = "IN_APP_PURCHASE"
            case subscription = "SUBSCRIPTION"
            case inAppPurchaseAndSubscription = "IN_APP_PURCHASE_AND_SUBSCRIPTION"
            case inAppPurchaseOrSubscription = "IN_APP_PURCHASE_OR_SUBSCRIPTION"
        }

        public enum Purpose: String, Codable, CaseIterable {
            case appropriateForAllUsers = "APPROPRIATE_FOR_ALL_USERS"
            case attractNewUsers = "ATTRACT_NEW_USERS"
            case keepActiveUsersInformed = "KEEP_ACTIVE_USERS_INFORMED"
            case bringBackLapsedUsers = "BRING_BACK_LAPSED_USERS"
        }

        public struct TerritorySchedules: Codable {
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
        }
    }

    public struct Relationships: Codable {
        public var localizations: Localizations?

        public init(localizations: Localizations? = nil) {
            self.localizations = localizations
        }

        public struct Localizations: Codable {
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
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appEventLocalizations" }

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

            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
