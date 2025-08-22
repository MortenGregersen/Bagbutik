import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # DeviceUpdateRequest
 The request body you use to update a Device.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/deviceupdaterequest>
 */
public struct DeviceUpdateRequest: Codable, Sendable, RequestBody {
    /// The resource data.
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
        public var type: String { "devices" }
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
            public var name: String?
            public var status: Status?

            public init(name: String? = nil,
                        status: Status? = nil)
            {
                self.name = name
                self.status = status
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                name = try container.decodeIfPresent(String.self, forKey: "name")
                status = try container.decodeIfPresent(Status.self, forKey: "status")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(name, forKey: "name")
                try container.encodeIfPresent(status, forKey: "status")
            }

            public enum Status: String, Sendable, Codable, CaseIterable {
                case disabled = "DISABLED"
                case enabled = "ENABLED"

                public init(from decoder: Decoder) throws {
                    let container = try decoder.singleValueContainer()
                    let string = try container.decode(String.self)
                    if let value = Status(rawValue: string) {
                        self = value
                    } else if let value = Status(rawValue: string.uppercased()) {
                        self = value
                    } else {
                        throw DecodingError.dataCorruptedError(
                            in: container,
                            debugDescription: "Invalid Status value: \(string)"
                        )
                    }
                }
            }
        }
    }
}
