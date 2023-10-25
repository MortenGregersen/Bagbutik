import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTestRequestInlineCreate
 A data structure that represents a sample match request for testing a rule set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestrequestinlinecreate>
 */
public struct GameCenterMatchmakingTestRequestInlineCreate: Codable, Identifiable {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        attributes = try container.decode(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encode(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case relationships
        case type
    }

    /**
     # GameCenterMatchmakingTestRequestInlineCreate.Attributes
     The attributes for a sample match request.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestrequestinlinecreate/attributes>
     */
    public struct Attributes: Codable {
        /// The app version of the game that makes the request.
        public let appVersion: String
        /// The bundle ID of the game that makes the request.
        public let bundleId: String
        /// The language and region that the player who initiates this match request uses.
        public var locale: Locale?
        /// The physical location where this request originates.
        public var location: Location?
        /// The maximum number of players that can join the match. This is the same value as the `GKMatchRequest.`[maxPlayers](https://developer.apple.com/documentation/gamekit/gkmatchrequest/1521083-maxplayers) property that you set when submitting a request from a native app.
        public var maxPlayers: Int?
        /// The minimum number of players that can join the match. This is the same value as the `GKMatchRequest.`[minPlayers](https://developer.apple.com/documentation/gamekit/gkmatchrequest/1520550-minplayers) property that you set when submitting a request from a native app.
        public var minPlayers: Int?
        /// The platform of the game that makes the request.
        public let platform: Platform
        /// The total number of players invited to join the match including the player who initiates the match request.
        public var playerCount: Int?
        /// A unique identifier for the request.
        public let requestName: String
        /// The age of the request in seconds.
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

        public enum Locale: String, Codable, CaseIterable {
            case AR - SA = "AR-SA"
            case CA - ES = "CA-ES"
            case CS - CZ = "CS-CZ"
            case DA - DK = "DA-DK"
            case DE - DE = "DE-DE"
            case EL - GR = "EL-GR"
            case EN - AU = "EN-AU"
            case EN - GB = "EN-GB"
            case EN - US = "EN-US"
            case EN - KY = "EN-KY"
            case ES - ES = "ES-ES"
            case ES - MX = "ES-MX"
            case FI - FI = "FI-FI"
            case FR - CA = "FR-CA"
            case FR - FR = "FR-FR"
            case HI - IN = "HI-IN"
            case HR - HR = "HR-HR"
            case HU - HU = "HU-HU"
            case ID - ID = "ID-ID"
            case IT - IT = "IT-IT"
            case IW - IL = "IW-IL"
            case JA - JP = "JA-JP"
            case KO - KR = "KO-KR"
            case MS - MY = "MS-MY"
            case NL - NL = "NL-NL"
            case NO - NO = "NO-NO"
            case PL - PL = "PL-PL"
            case PT - BR = "PT-BR"
            case PT - PT = "PT-PT"
            case RO - RO = "RO-RO"
            case RU - RU = "RU-RU"
            case SK - SK = "SK-SK"
            case SV - SE = "SV-SE"
            case TH - TH = "TH-TH"
            case TR - TR = "TR-TR"
            case UK - UA = "UK-UA"
            case ZH - CN = "ZH-CN"
            case ZH - TW = "ZH-TW"
            case ZH - HK = "ZH-HK"
        }
    }

    /**
     # GameCenterMatchmakingTestRequestInlineCreate.Relationships
     The relationships of a match request to other objects.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestrequestinlinecreate/relationships>
     */
    public struct Relationships: Codable {
        public var matchmakingPlayerProperties: MatchmakingPlayerProperties?

        public init(matchmakingPlayerProperties: MatchmakingPlayerProperties? = nil) {
            self.matchmakingPlayerProperties = matchmakingPlayerProperties
        }

        /**
         # GameCenterMatchmakingTestRequestInlineCreate.Relationships.MatchmakingPlayerProperties
         A resource object for the game-specific properties for a match request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestrequestinlinecreate/relationships/matchmakingplayerproperties>
         */
        public struct MatchmakingPlayerProperties: Codable {
            @NullCodable public var data: [Data]?

            public init(data: [Data]? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
            }

            private enum CodingKeys: String, CodingKey {
                case data
            }

            /**
             # GameCenterMatchmakingTestRequestInlineCreate.Relationships.MatchmakingPlayerProperties.Data
             The resource object for the game-specific properties of a match request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestrequestinlinecreate/relationships/matchmakingplayerproperties/data>
             */
            public struct Data: Codable, Identifiable {
                /// The identifier for a ``GameCenterMatchmakingTestPlayerPropertyInlineCreate`` resource object that you add to the `included` field of the request.
                public let id: String
                /// The type of resource object.
                public var type: String { "gameCenterMatchmakingTestPlayerProperties" }

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
        }
    }
}
