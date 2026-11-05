import BagbutikCore
import Foundation

/**
 # SubscriptionRetentionMessageOffersLinkagesRequest

 The request body you use to add or remove retention offers from a subscription’s retention message.

 ```
 object SubscriptionRetentionMessageOffersLinkagesRequest
 ```

 ## Topics

 ### Dictionaries

 [`object SubscriptionRetentionMessageOffersLinkagesRequest.Data`](https://developer.apple.com/documentation/AppStoreConnectAPI/SubscriptionRetentionMessageOffersLinkagesRequest/Data-data.dictionary)

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionretentionmessageofferslinkagesrequest>
 */
public struct SubscriptionRetentionMessageOffersLinkagesRequest: Codable, Sendable, RequestBody {
    public let data: [Data]

    public init(data: [Data]) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([Data].self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "retentionOffers" }

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
