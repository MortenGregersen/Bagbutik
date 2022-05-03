import Foundation

public struct AppEvent: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appEvents" }
    /// The resource's attributes.
    public let attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
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
        case id
        case links
        case type
        case attributes
        case relationships
    }

    public struct Attributes: Codable {
        @NullCodable public var archivedTerritorySchedules: [ArchivedTerritorySchedules]?
        @NullCodable public var badge: Badge?
        public var deepLink: String?
        @NullCodable public var eventState: EventState?
        public var primaryLocale: String?
        @NullCodable public var priority: Priority?
        @NullCodable public var purchaseRequirement: PurchaseRequirement?
        @NullCodable public var purpose: Purpose?
        public var referenceName: String?
        @NullCodable public var territorySchedules: [TerritorySchedules]?

        public init(archivedTerritorySchedules: [ArchivedTerritorySchedules]? = nil, badge: Badge? = nil, deepLink: String? = nil, eventState: EventState? = nil, primaryLocale: String? = nil, priority: Priority? = nil, purchaseRequirement: PurchaseRequirement? = nil, purpose: Purpose? = nil, referenceName: String? = nil, territorySchedules: [TerritorySchedules]? = nil) {
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
            @NullCodable public var territories: [String]?

            public init(eventEnd: Date? = nil, eventStart: Date? = nil, publishStart: Date? = nil, territories: [String]? = nil) {
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
            @NullCodable public var territories: [String]?

            public init(eventEnd: Date? = nil, eventStart: Date? = nil, publishStart: Date? = nil, territories: [String]? = nil) {
                self.eventEnd = eventEnd
                self.eventStart = eventStart
                self.publishStart = publishStart
                self.territories = territories
            }
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appevent/relationships>
     */
    public struct Relationships: Codable {
        @NullCodable public var localizations: Localizations?

        public init(localizations: Localizations? = nil) {
            self.localizations = localizations
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appevent/relationships/localizations>
         */
        public struct Localizations: Codable {
            /// The type and ID of a related resource.
            @NullCodable public var data: [Data]?
            /// The links to the related data and the relationship's self-link.
            @NullCodable public var links: Links?
            /// Paging information for data responses.
            @NullCodable public var meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appevent/relationships/localizations/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
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

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appevent/relationships/localizations/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public var related: String?
                /// The relationship's self-link
                public var itself: String?

                public init(related: String? = nil, self itself: String? = nil) {
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
                    case related
                    case itself = "self"
                }
            }
        }
    }
}
