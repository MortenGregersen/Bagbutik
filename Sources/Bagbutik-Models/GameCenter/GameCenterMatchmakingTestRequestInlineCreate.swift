import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTestRequestInlineCreate
 A data structure that represents a sample match request for testing a rule set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestrequestinlinecreate>
 */
public struct GameCenterMatchmakingTestRequestInlineCreate: Codable, Sendable, Identifiable {
    /// A unique identifier for the match request.
    public var id: String?
    /// The type of resource object.
    public var type: String { "gameCenterMatchmakingTestRequests" }
    /// The object attributes.
    public let attributes: Attributes
    /// The object relationships.
    public var relationships: Relationships?

    public init(id: String? = nil,
                attributes: Attributes,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decodeIfPresent(String.self, forKey: "id")
        attributes = try container.decode(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(id, forKey: "id")
        try container.encode(type, forKey: "type")
        try container.encode(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public let appVersion: String
        public let bundleId: String
        public var locale: Locale?
        public var location: Location?
        public var maxPlayers: Int?
        public var minPlayers: Int?
        public let platform: Platform
        public var playerCount: Int?
        public let requestName: String
        public let secondsInQueue: Int

        public init(appVersion: String,
                    bundleId: String,
                    locale: Locale? = nil,
                    location: Location? = nil,
                    maxPlayers: Int? = nil,
                    minPlayers: Int? = nil,
                    platform: Platform,
                    playerCount: Int? = nil,
                    requestName: String,
                    secondsInQueue: Int)
        {
            self.appVersion = appVersion
            self.bundleId = bundleId
            self.locale = locale
            self.location = location
            self.maxPlayers = maxPlayers
            self.minPlayers = minPlayers
            self.platform = platform
            self.playerCount = playerCount
            self.requestName = requestName
            self.secondsInQueue = secondsInQueue
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appVersion = try container.decode(String.self, forKey: "appVersion")
            bundleId = try container.decode(String.self, forKey: "bundleId")
            locale = try container.decodeIfPresent(Locale.self, forKey: "locale")
            location = try container.decodeIfPresent(Location.self, forKey: "location")
            maxPlayers = try container.decodeIfPresent(Int.self, forKey: "maxPlayers")
            minPlayers = try container.decodeIfPresent(Int.self, forKey: "minPlayers")
            platform = try container.decode(Platform.self, forKey: "platform")
            playerCount = try container.decodeIfPresent(Int.self, forKey: "playerCount")
            requestName = try container.decode(String.self, forKey: "requestName")
            secondsInQueue = try container.decode(Int.self, forKey: "secondsInQueue")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(appVersion, forKey: "appVersion")
            try container.encode(bundleId, forKey: "bundleId")
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(location, forKey: "location")
            try container.encodeIfPresent(maxPlayers, forKey: "maxPlayers")
            try container.encodeIfPresent(minPlayers, forKey: "minPlayers")
            try container.encode(platform, forKey: "platform")
            try container.encodeIfPresent(playerCount, forKey: "playerCount")
            try container.encode(requestName, forKey: "requestName")
            try container.encode(secondsInQueue, forKey: "secondsInQueue")
        }

        public enum Locale: String, Sendable, Codable, CaseIterable {
            case AR_SA = "AR-SA"
            case CA_ES = "CA-ES"
            case CS_CZ = "CS-CZ"
            case DA_DK = "DA-DK"
            case DE_DE = "DE-DE"
            case EL_GR = "EL-GR"
            case EN_AU = "EN-AU"
            case EN_GB = "EN-GB"
            case EN_KY = "EN-KY"
            case EN_US = "EN-US"
            case ES_ES = "ES-ES"
            case ES_MX = "ES-MX"
            case FI_FI = "FI-FI"
            case FR_CA = "FR-CA"
            case FR_FR = "FR-FR"
            case HI_IN = "HI-IN"
            case HR_HR = "HR-HR"
            case HU_HU = "HU-HU"
            case ID_ID = "ID-ID"
            case IT_IT = "IT-IT"
            case IW_IL = "IW-IL"
            case JA_JP = "JA-JP"
            case KO_KR = "KO-KR"
            case MS_MY = "MS-MY"
            case NL_NL = "NL-NL"
            case NO_NO = "NO-NO"
            case PL_PL = "PL-PL"
            case PT_BR = "PT-BR"
            case PT_PT = "PT-PT"
            case RO_RO = "RO-RO"
            case RU_RU = "RU-RU"
            case SK_SK = "SK-SK"
            case SV_SE = "SV-SE"
            case TH_TH = "TH-TH"
            case TR_TR = "TR-TR"
            case UK_UA = "UK-UA"
            case ZH_CN = "ZH-CN"
            case ZH_HK = "ZH-HK"
            case ZH_TW = "ZH-TW"
        }
    }

    public struct Relationships: Codable, Sendable {
        public var matchmakingPlayerProperties: MatchmakingPlayerProperties?

        public init(matchmakingPlayerProperties: MatchmakingPlayerProperties? = nil) {
            self.matchmakingPlayerProperties = matchmakingPlayerProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            matchmakingPlayerProperties = try container.decodeIfPresent(MatchmakingPlayerProperties.self, forKey: "matchmakingPlayerProperties")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(matchmakingPlayerProperties, forKey: "matchmakingPlayerProperties")
        }

        public struct MatchmakingPlayerProperties: Codable, Sendable {
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
                public var type: String { "gameCenterMatchmakingTestPlayerProperties" }

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
