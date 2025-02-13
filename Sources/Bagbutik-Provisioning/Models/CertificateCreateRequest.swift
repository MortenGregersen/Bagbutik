import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CertificateCreateRequest
 The request body you use to create a Certificate.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificatecreaterequest>
 */
public struct CertificateCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "certificates" }
        public let attributes: Attributes
        public var relationships: Relationships?

        public init(attributes: Attributes,
                    relationships: Relationships? = nil)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public let certificateType: CertificateType
            public let csrContent: String

            public init(certificateType: CertificateType,
                        csrContent: String)
            {
                self.certificateType = certificateType
                self.csrContent = csrContent
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                certificateType = try container.decode(CertificateType.self, forKey: "certificateType")
                csrContent = try container.decode(String.self, forKey: "csrContent")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(certificateType, forKey: "certificateType")
                try container.encode(csrContent, forKey: "csrContent")
            }
        }

        public struct Relationships: Codable, Sendable {
            public var merchantId: MerchantId?

            public init(merchantId: MerchantId? = nil) {
                self.merchantId = merchantId
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                merchantId = try container.decodeIfPresent(MerchantId.self, forKey: "merchantId")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(merchantId, forKey: "merchantId")
            }

            public struct MerchantId: Codable, Sendable {
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
                    public var type: String { "merchantIds" }

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
        }
    }
}
