import BagbutikCore
import Foundation

/**
 # GameCenterAchievementGroupAchievementLinkageRequest

 The request body you use to attach an achievement to an achievement group.

 ```
 object GameCenterAchievementGroupAchievementLinkageRequest
 ```

 ## Topics

 ### Objects

 [`object GameCenterAchievementGroupAchievementLinkageRequest.Data`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterAchievementGroupAchievementLinkageRequest/Data-data.dictionary)

 The resource linkage data for setting the group achievement associated with a Game Center achievement.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementgroupachievementlinkagerequest>
 */
public struct GameCenterAchievementGroupAchievementLinkageRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "gameCenterAchievements" }

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
