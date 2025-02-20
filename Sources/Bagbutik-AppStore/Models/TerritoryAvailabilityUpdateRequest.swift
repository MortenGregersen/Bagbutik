import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # TerritoryAvailabilityUpdateRequest
 The request body you use to update a single territory availability resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/territoryavailabilityupdaterequest>
 */
public struct TerritoryAvailabilityUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "territoryAvailabilities" }
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
            public var available: Bool?
            public var preOrderEnabled: Bool?
            public var releaseDate: String?

            public init(available: Bool? = nil,
                        preOrderEnabled: Bool? = nil,
                        releaseDate: String? = nil)
            {
                self.available = available
                self.preOrderEnabled = preOrderEnabled
                self.releaseDate = releaseDate
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                available = try container.decodeIfPresent(Bool.self, forKey: "available")
                preOrderEnabled = try container.decodeIfPresent(Bool.self, forKey: "preOrderEnabled")
                releaseDate = try container.decodeIfPresent(String.self, forKey: "releaseDate")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(available, forKey: "available")
                try container.encodeIfPresent(preOrderEnabled, forKey: "preOrderEnabled")
                try container.encodeIfPresent(releaseDate, forKey: "releaseDate")
            }
        }
    }
}
