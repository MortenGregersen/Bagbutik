import BagbutikCore
import Foundation

/**
 # PassTypeIdCreateRequest

 The request body for registering a new pass type identifier for Wallet pass signing.

 ```
 object PassTypeIdCreateRequest
 ```

 ## Topics

 ### Dictionaries

 [`object PassTypeIdCreateRequest.Data`](https://developer.apple.com/documentation/AppStoreConnectAPI/PassTypeIdCreateRequest/Data-data.dictionary)

 The data wrapper for a pass type ID create request, containing the resource type and identifier attributes.

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/passtypeidcreaterequest>
 */
public struct PassTypeIdCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "passTypeIds" }
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public let identifier: String
            public let name: String

            public init(identifier: String,
                        name: String)
            {
                self.identifier = identifier
                self.name = name
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                identifier = try container.decode(String.self, forKey: "identifier")
                name = try container.decode(String.self, forKey: "name")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(identifier, forKey: "identifier")
                try container.encode(name, forKey: "name")
            }
        }
    }
}
