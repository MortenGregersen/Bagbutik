import Bagbutik_Core
import Foundation

/**
 # TerritoryAvailability
 The data structure that represents a territory availability resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/territoryavailability>
 */
public struct TerritoryAvailability: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "territoryAvailabilities" }
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
        public var available: Bool?
        public var contentStatuses: [ContentStatuses]?
        public var preOrderEnabled: Bool?
        public var preOrderPublishDate: String?
        public var releaseDate: String?

        public init(available: Bool? = nil,
                    contentStatuses: [ContentStatuses]? = nil,
                    preOrderEnabled: Bool? = nil,
                    preOrderPublishDate: String? = nil,
                    releaseDate: String? = nil)
        {
            self.available = available
            self.contentStatuses = contentStatuses
            self.preOrderEnabled = preOrderEnabled
            self.preOrderPublishDate = preOrderPublishDate
            self.releaseDate = releaseDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            available = try container.decodeIfPresent(Bool.self, forKey: "available")
            contentStatuses = try container.decodeIfPresent([ContentStatuses].self, forKey: "contentStatuses")
            preOrderEnabled = try container.decodeIfPresent(Bool.self, forKey: "preOrderEnabled")
            preOrderPublishDate = try container.decodeIfPresent(String.self, forKey: "preOrderPublishDate")
            releaseDate = try container.decodeIfPresent(String.self, forKey: "releaseDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(available, forKey: "available")
            try container.encodeIfPresent(contentStatuses, forKey: "contentStatuses")
            try container.encodeIfPresent(preOrderEnabled, forKey: "preOrderEnabled")
            try container.encodeIfPresent(preOrderPublishDate, forKey: "preOrderPublishDate")
            try container.encodeIfPresent(releaseDate, forKey: "releaseDate")
        }

        public enum ContentStatuses: String, Sendable, Codable, CaseIterable {
            case available = "AVAILABLE"
            case availableForPreorder = "AVAILABLE_FOR_PREORDER"
            case availableForPreorderOnDate = "AVAILABLE_FOR_PREORDER_ON_DATE"
            case availableForSaleUnreleasedApp = "AVAILABLE_FOR_SALE_UNRELEASED_APP"
            case brazilRequiredTaxId = "BRAZIL_REQUIRED_TAX_ID"
            case cannotSell = "CANNOT_SELL"
            case cannotSellAdultOnly = "CANNOT_SELL_ADULT_ONLY"
            case cannotSellCasino = "CANNOT_SELL_CASINO"
            case cannotSellCasinoWithoutAgeVerification = "CANNOT_SELL_CASINO_WITHOUT_AGE_VERIFICATION"
            case cannotSellCasinoWithoutGrac = "CANNOT_SELL_CASINO_WITHOUT_GRAC"
            case cannotSellContests = "CANNOT_SELL_CONTESTS"
            case cannotSellFrequentIntense = "CANNOT_SELL_FREQUENT_INTENSE"
            case cannotSellFrequentIntenseAlcoholTobaccoDrugs = "CANNOT_SELL_FREQUENT_INTENSE_ALCOHOL_TOBACCO_DRUGS"
            case cannotSellFrequentIntenseGambling = "CANNOT_SELL_FREQUENT_INTENSE_GAMBLING"
            case cannotSellFrequentIntenseSexualContentNudity = "CANNOT_SELL_FREQUENT_INTENSE_SEXUAL_CONTENT_NUDITY"
            case cannotSellFrequentIntenseViolence = "CANNOT_SELL_FREQUENT_INTENSE_VIOLENCE"
            case cannotSellFrequentIntenseWithoutGrac = "CANNOT_SELL_FREQUENT_INTENSE_WITHOUT_GRAC"
            case cannotSellGambling = "CANNOT_SELL_GAMBLING"
            case cannotSellGamblingContests = "CANNOT_SELL_GAMBLING_CONTESTS"
            case cannotSellInfrequentMildAlcoholTobaccoDrugs = "CANNOT_SELL_INFREQUENT_MILD_ALCOHOL_TOBACCO_DRUGS"
            case cannotSellInfrequentMildSexualContentNudity = "CANNOT_SELL_INFREQUENT_MILD_SEXUAL_CONTENT_NUDITY"
            case cannotSellNonIosGames = "CANNOT_SELL_NON_IOS_GAMES"
            case cannotSellRestrictedRating = "CANNOT_SELL_RESTRICTED_RATING"
            case cannotSellSeventeenPlusApps = "CANNOT_SELL_SEVENTEEN_PLUS_APPS"
            case cannotSellSeventeenPlusGames = "CANNOT_SELL_SEVENTEEN_PLUS_GAMES"
            case cannotSellSexuallyExplicit = "CANNOT_SELL_SEXUALLY_EXPLICIT"
            case missingGrn = "MISSING_GRN"
            case missingRating = "MISSING_RATING"
            case preorderOnUnreleasedApp = "PREORDER_ON_UNRELEASED_APP"
            case processingToAvailable = "PROCESSING_TO_AVAILABLE"
            case processingToNotAvailable = "PROCESSING_TO_NOT_AVAILABLE"
            case processingToPreOrder = "PROCESSING_TO_PRE_ORDER"
            case unverifiedGrn = "UNVERIFIED_GRN"
        }
    }

    public struct Relationships: Codable, Sendable {
        public var territory: Territory?

        public init(territory: Territory? = nil) {
            self.territory = territory
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            territory = try container.decodeIfPresent(Territory.self, forKey: "territory")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(territory, forKey: "territory")
        }

        public struct Territory: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
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
