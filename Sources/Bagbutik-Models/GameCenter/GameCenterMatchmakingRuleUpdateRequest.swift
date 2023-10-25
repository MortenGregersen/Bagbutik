import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleUpdateRequest
 The request body you use to modify a rule.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleupdaterequest>
 */
public struct GameCenterMatchmakingRuleUpdateRequest: Codable, RequestBody {
    /// The data structure of the request body.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # GameCenterMatchmakingRuleUpdateRequest.Data
     The data structure of the request body you use to modify a rule.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// A unique identifier for the rule.
        public let id: String
        public var type: String { "gameCenterMatchmakingRules" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case id
            case type
        }

        /**
         # GameCenterMatchmakingRuleUpdateRequest.Data.Attributes
         The attributes of a rule that you modify.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// A human-readable description of the rule.
            public var description: String?
            /// Code that returns a Boolean or numeric value that the matchmaking rules algorithm executes to compare or filter match requests.
            public var expression: String?
            /// A numeric value for the rule when `type` is either `DISTANCE` or `MATCH`.
            public var weight: Double?

            public init(description: String? = nil,
                        expression: String? = nil,
                        weight: Double? = nil)
            {
                self.description = description
                self.expression = expression
                self.weight = weight
            }
        }
    }
}
