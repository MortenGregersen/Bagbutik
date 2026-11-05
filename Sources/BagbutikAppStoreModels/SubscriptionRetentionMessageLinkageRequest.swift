import BagbutikCore
import Foundation

/**
 # SubscriptionRetentionMessageLinkageRequest

 The request body you use to assign a retention message to an auto-renewable subscription.

 ```
 object SubscriptionRetentionMessageLinkageRequest
 ```

 ## Topics

 ### Objects

 [`object SubscriptionRetentionMessageLinkageRequest.Data`](https://developer.apple.com/documentation/AppStoreConnectAPI/SubscriptionRetentionMessageLinkageRequest/Data-data.dictionary)

 The type and ID of the retention message to assign to the subscription.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionretentionmessagelinkagerequest>
 */
public struct SubscriptionRetentionMessageLinkageRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "retentionMessages" }

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
