import Bagbutik_Core
import Foundation

/**
 # GameCenterGroupCreateRequest
 The request body you use to create a group.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentergroupcreaterequest>
 */
public struct GameCenterGroupCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable {
        public var type: String { "gameCenterGroups" }
        public var attributes: Attributes?

        public init(attributes: Attributes? = nil) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case type
        }

        public struct Attributes: Codable {
            public var referenceName: String?

            public init(referenceName: String? = nil) {
                self.referenceName = referenceName
            }
        }
    }
}
