import BagbutikCore
import Foundation

/**
 # GameCenterDetailPlayerUpdateRequest

 The request body you use to update a Game Center detail player.

 ```
 object GameCenterDetailPlayerUpdateRequest
 ```

 ## Topics

 ### Objects

 [`object GameCenterDetailPlayerUpdateRequest.Data`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterDetailPlayerUpdateRequest/Data-data.dictionary)

 The resource data for the Game Center detail player you update.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterdetailplayerupdaterequest>
 */
public struct GameCenterDetailPlayerUpdateRequest: Codable, Sendable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "gameCenterDetailPlayers" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public var blocked: Bool?
            public var bundleId: String?

            public init(blocked: Bool? = nil,
                        bundleId: String? = nil)
            {
                self.blocked = blocked
                self.bundleId = bundleId
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                blocked = try container.decodeIfPresent(Bool.self, forKey: "blocked")
                bundleId = try container.decodeIfPresent(String.self, forKey: "bundleId")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(blocked, forKey: "blocked")
                try container.encodeIfPresent(bundleId, forKey: "bundleId")
            }
        }
    }
}
