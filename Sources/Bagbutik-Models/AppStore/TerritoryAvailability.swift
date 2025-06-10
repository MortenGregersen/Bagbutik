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
            case cannotSellGambling = "CANNOT_SELL_GAMBLING"
            case cannotSellGamblingContests = "CANNOT_SELL_GAMBLING_CONTESTS"
            case cannotSellNonIosGames = "CANNOT_SELL_NON_IOS_GAMES"
            case cannotSellRestrictedRating = "CANNOT_SELL_RESTRICTED_RATING"
            case cannotSellSeventeenPlusApps = "CANNOT_SELL_SEVENTEEN_PLUS_APPS"
            case cannotSellSeventeenPlusGames = "CANNOT_SELL_SEVENTEEN_PLUS_GAMES"
            case cannotSellSexuallyExplicit = "CANNOT_SELL_SEXUALLY_EXPLICIT"
            case icpNumberInvalid = "ICP_NUMBER_INVALID"
            case icpNumberMissing = "ICP_NUMBER_MISSING"
            case missingGrn = "MISSING_GRN"
            case missingRating = "MISSING_RATING"
            case preorderOnUnreleasedApp = "PREORDER_ON_UNRELEASED_APP"
            case processingToAvailable = "PROCESSING_TO_AVAILABLE"
            case processingToNotAvailable = "PROCESSING_TO_NOT_AVAILABLE"
            case processingToPreOrder = "PROCESSING_TO_PRE_ORDER"
            case traderStatusNotProvided = "TRADER_STATUS_NOT_PROVIDED"
            case traderStatusVerificationFailed = "TRADER_STATUS_VERIFICATION_FAILED"
            case traderStatusVerificationStatusMissing = "TRADER_STATUS_VERIFICATION_STATUS_MISSING"
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
