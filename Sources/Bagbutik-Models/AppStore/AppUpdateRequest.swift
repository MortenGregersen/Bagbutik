import Bagbutik_Core
import Foundation

public struct AppUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "apps" }
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
            public var bundleId: String?
            public var contentRightsDeclaration: App.Attributes.ContentRightsDeclaration?
            public var primaryLocale: String?
            public var streamlinedPurchasingEnabled: Bool?
            public var subscriptionStatusUrl: String?
            public var subscriptionStatusUrlForSandbox: String?
            public var subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion?
            public var subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion?

            public init(bundleId: String? = nil,
                        contentRightsDeclaration: App.Attributes.ContentRightsDeclaration? = nil,
                        primaryLocale: String? = nil,
                        streamlinedPurchasingEnabled: Bool? = nil,
                        subscriptionStatusUrl: String? = nil,
                        subscriptionStatusUrlForSandbox: String? = nil,
                        subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion? = nil,
                        subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion? = nil)
            {
                self.bundleId = bundleId
                self.contentRightsDeclaration = contentRightsDeclaration
                self.primaryLocale = primaryLocale
                self.streamlinedPurchasingEnabled = streamlinedPurchasingEnabled
                self.subscriptionStatusUrl = subscriptionStatusUrl
                self.subscriptionStatusUrlForSandbox = subscriptionStatusUrlForSandbox
                self.subscriptionStatusUrlVersion = subscriptionStatusUrlVersion
                self.subscriptionStatusUrlVersionForSandbox = subscriptionStatusUrlVersionForSandbox
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                bundleId = try container.decodeIfPresent(String.self, forKey: "bundleId")
                contentRightsDeclaration = try container.decodeIfPresent(App.Attributes.ContentRightsDeclaration.self, forKey: "contentRightsDeclaration")
                primaryLocale = try container.decodeIfPresent(String.self, forKey: "primaryLocale")
                streamlinedPurchasingEnabled = try container.decodeIfPresent(Bool.self, forKey: "streamlinedPurchasingEnabled")
                subscriptionStatusUrl = try container.decodeIfPresent(String.self, forKey: "subscriptionStatusUrl")
                subscriptionStatusUrlForSandbox = try container.decodeIfPresent(String.self, forKey: "subscriptionStatusUrlForSandbox")
                subscriptionStatusUrlVersion = try container.decodeIfPresent(SubscriptionStatusUrlVersion.self, forKey: "subscriptionStatusUrlVersion")
                subscriptionStatusUrlVersionForSandbox = try container.decodeIfPresent(SubscriptionStatusUrlVersion.self, forKey: "subscriptionStatusUrlVersionForSandbox")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(bundleId, forKey: "bundleId")
                try container.encodeIfPresent(contentRightsDeclaration, forKey: "contentRightsDeclaration")
                try container.encodeIfPresent(primaryLocale, forKey: "primaryLocale")
                try container.encodeIfPresent(streamlinedPurchasingEnabled, forKey: "streamlinedPurchasingEnabled")
                try container.encodeIfPresent(subscriptionStatusUrl, forKey: "subscriptionStatusUrl")
                try container.encodeIfPresent(subscriptionStatusUrlForSandbox, forKey: "subscriptionStatusUrlForSandbox")
                try container.encodeIfPresent(subscriptionStatusUrlVersion, forKey: "subscriptionStatusUrlVersion")
                try container.encodeIfPresent(subscriptionStatusUrlVersionForSandbox, forKey: "subscriptionStatusUrlVersionForSandbox")
            }
        }
    }
}
