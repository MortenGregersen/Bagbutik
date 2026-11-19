import BagbutikCore
import Foundation

/**
 # SubscriptionPriceChangePreview

 The result of previewing a subscription price change in each proposed territory.

 ```
 object SubscriptionPriceChangePreview
 ```

 ## Topics

 ### Objects

 [`object SubscriptionPriceChangePreview.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/SubscriptionPriceChangePreview/Attributes-data.dictionary)

 Attributes that describe a subscription price change preview resource.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionpricechangepreview>
 */
public struct SubscriptionPriceChangePreview: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "subscriptionPriceChangePreviews" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
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
    }

    public struct Attributes: Codable, Sendable {
        public var changeResults: [ChangeResults]?

        public init(changeResults: [ChangeResults]? = nil) {
            self.changeResults = changeResults
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            changeResults = try container.decodeIfPresent([ChangeResults].self, forKey: "changeResults")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(changeResults, forKey: "changeResults")
        }

        public struct ChangeResults: Codable, Sendable {
            public var changeType: ChangeType?
            public var territoryId: String?

            public init(changeType: ChangeType? = nil,
                        territoryId: String? = nil)
            {
                self.changeType = changeType
                self.territoryId = territoryId
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                changeType = try container.decodeIfPresent(ChangeType.self, forKey: "changeType")
                territoryId = try container.decodeIfPresent(String.self, forKey: "territoryId")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(changeType, forKey: "changeType")
                try container.encodeIfPresent(territoryId, forKey: "territoryId")
            }

            public enum ChangeType: String, Sendable, Codable, CaseIterable {
                case decreaseNotPreservable = "DECREASE_NOT_PRESERVABLE"
                case increasePreservable = "INCREASE_PRESERVABLE"
                case mixedNotPreservable = "MIXED_NOT_PRESERVABLE"
                case noChange = "NO_CHANGE"

                public init(from decoder: Decoder) throws {
                    let container = try decoder.singleValueContainer()
                    let string = try container.decode(String.self)
                    if let value = ChangeType(rawValue: string) {
                        self = value
                    } else if let value = ChangeType(rawValue: string.uppercased()) {
                        self = value
                    } else {
                        throw DecodingError.dataCorruptedError(
                            in: container,
                            debugDescription: "Invalid ChangeType value: \(string)"
                        )
                    }
                }
            }
        }
    }
}
